import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../enum/user_status.dart';
import '../enum/user_type.dart';
import '../model/user.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool _isInitialized = false;

  Future<void> initSignIn() async {
    if (!_isInitialized) {
      await _googleSignIn.initialize(
        serverClientId:
            "1068138876918-cobmcoavh3g195di5id83sksac9di3fb.apps.googleusercontent.com",
      );
      _isInitialized = true;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await initSignIn();
      print("DEBUG: Starting Google Sign-In...");

      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();

      if (googleUser == null) {
        print("DEBUG: Google Sign-In cancelled by user");
        return null;
      }

      print("DEBUG: Google user signed in: ${googleUser.email}");

      // Get Google auth tokens
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user != null) {
        print("DEBUG: Firebase user signed in: ${user.email}");

        final userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid);

        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': user.uid,
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'photoURL': user.photoURL ?? '',
            'provider': 'google',
            'createdAt': FieldValue.serverTimestamp(),
          });
          print("DEBUG: New Firestore user document created for ${user.email}");
        }
      }

      return userCredential;
    } catch (e, stack) {
      print("ERROR during Google Sign-In: $e");
      print("STACKTRACE: $stack");
      rethrow;
    }
  }

  // Future<AppUser?> signInWithGoogle() async {
  //   try {
  //     print("⬇ Initializing Google Sign-In...");
  //     await GoogleSignIn.instance.initialize();
  //
  //     print("⬆ Performing Google authentication...");
  //     final GoogleSignInAccount user = await GoogleSignIn.instance
  //         .authenticate();
  //
  //     if (user == null) {
  //       print("❌ User cancelled Google sign-in");
  //       return null;
  //     }
  //
  //     print("🔹 User signed in with Google: ${user.email}");
  //
  //     // Fetch authentication tokens
  //     final GoogleSignInAuthentication auth = await user.authentication;
  //     print("🔹 Received idToken: ${auth.idToken != null}");
  //
  //     // Firebase credential
  //     final credential = GoogleAuthProvider.credential(idToken: auth.idToken);
  //
  //     // Sign into Firebase
  //     final userCredential = await _auth.signInWithCredential(credential);
  //     final firebaseUser = userCredential.user;
  //     if (firebaseUser == null) return null;
  //
  //     print("✅ Firebase user signed in: ${firebaseUser.uid}");
  //
  //     // Check if Firestore user exists
  //     final userDoc = await _firestore
  //         .collection('users')
  //         .doc(firebaseUser.uid)
  //         .get();
  //     if (!userDoc.exists) {
  //       print("➕ New user — creating Firestore profile...");
  //       final appUser = AppUser(
  //         id: firebaseUser.uid,
  //         name: firebaseUser.displayName ?? '',
  //         email: firebaseUser.email ?? '',
  //         phone: firebaseUser.phoneNumber ?? '',
  //         type: AppUserType.none,
  //         location: '',
  //         gender: Gender.none,
  //         profileImageUrl: firebaseUser.photoURL ?? '',
  //         status: UserStatus.available,
  //       );
  //       await _firestore
  //           .collection('users')
  //           .doc(firebaseUser.uid)
  //           .set(appUser.toMap());
  //       return appUser;
  //     } else {
  //       print("🔄 Existing user — loading from Firestore");
  //       return AppUser.fromMap(userDoc.data()!);
  //     }
  //   } on GoogleSignInException catch (e) {
  //     print("❌ GoogleSignInException: ${e.code} - ${e.description}");
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     print("❌ FirebaseAuthException: ${e.code} - ${e.message}");
  //     return null;
  //   } catch (e, stack) {
  //     print("❌ Unexpected error during Google Sign-In: $e");
  //     print(stack);
  //     return null;
  //   }
  // }

  // Upload profile image
  Future<String> uploadProfileImage(String uid, File imageFile) async {
    try {
      final ref = _storage.ref().child("users/$uid/profile.jpg");
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception("Image upload failed: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection. Please try again.");
    } catch (e) {
      throw Exception("Unexpected error uploading image: $e");
    }
  }

  // Sign up user
  Future<AppUser?> signUp({
    required String name,
    required String email,
    required String password,
    required AppUserType type,
    String location = '',
    File? profileImage,
  }) async {
    try {
      // Firebase Auth signup
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw Exception("User account could not be created.");
      }

      // Upload profile image if provided
      String imageUrl = '';
      if (profileImage != null) {
        imageUrl = await uploadProfileImage(user.uid, profileImage);
      }

      // Create AppUser
      final appUser = AppUser(
        id: user.uid,
        name: name,
        email: email,
        phone: '',
        type: type,
        location: location,
        profileImageUrl: imageUrl,
        status: UserStatus.available,
      );

      // Save to Firestore
      await _firestore.collection('users').doc(user.uid).set(appUser.toMap());

      return appUser;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception("Email is already registered.");
        case 'invalid-email':
          throw Exception("Invalid email address.");
        case 'weak-password':
          throw Exception("Password should be at least 6 characters.");
        case 'network-request-failed':
          throw Exception("Network error. Please check your connection.");
        default:
          throw Exception("Signup failed: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error during signup: $e");
    }
  }

  // Fetch user by UID
  Future<AppUser?> getUserByUid(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return null;
      return AppUser.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw Exception("Failed to fetch user: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("Unexpected error fetching user: $e");
    }
  }

  // Login
  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception("No user found with this email.");
        case 'wrong-password':
          throw Exception("Invalid password.");
        case 'invalid-email':
          throw Exception("Invalid email format.");
        case 'network-request-failed':
          throw Exception("Network error. Please try again.");
        default:
          throw Exception("Login failed: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error during login: $e");
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      // Firebase sign out
      await _auth.signOut();

      // Google sign out (always safe to call)
      await GoogleSignIn.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception("Logout failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error during logout: $e");
    }
  }

  // Update entire user document
  Future<void> updateUser(AppUser user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } on FirebaseException catch (e) {
      throw Exception("Failed to update user: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("Unexpected error updating user: $e");
    }
  }

  // Update user status
  Future<void> updateStatus(String uid, UserStatus status) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'status': status.name,
      });
    } on FirebaseException catch (e) {
      throw Exception("Failed to update status: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("Unexpected error updating status: $e");
    }
  }

  // Update location
  Future<void> updateLocation(String uid, String location) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'location': location,
      });
    } on FirebaseException catch (e) {
      throw Exception("Failed to update location: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("Unexpected error updating location: $e");
    }
  }

  // Save or update user type
  Future<void> saveUserType(String uid, AppUserType type) async {
    try {
      await _firestore.collection('users').doc(uid).update({'type': type.name});
    } on FirebaseException catch (e) {
      throw Exception("Failed to save user type: ${e.message}");
    } on SocketException {
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("Unexpected error saving user type: $e");
    }
  }

  // Real-time user stream
  Stream<AppUser?> streamUser(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return AppUser.fromMap(doc.data()!);
    });
  }

  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }
}
