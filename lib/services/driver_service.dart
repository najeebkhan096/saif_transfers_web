// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/user.dart';
import '../enum/user_status.dart';
import '../enum/user_type.dart';

class DriverService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference get _usersRef => _firestore.collection('users');

  /// 🔹 Get a single driver by ID
  Future<AppUser?> getDriverById(String driverId) async {
    try {
      final doc = await _usersRef.doc(driverId).get();
      if (doc.exists) {
        return AppUser.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print("❌ Error fetching driver: $e");
      return null;
    }
  }

  /// 🔹 Get all drivers (optionally filter by online/offline)
  Future<List<AppUser>> getAllDrivers({bool? onlineOnly}) async {
    try {
      Query query = _usersRef.where('type', isEqualTo: AppUserType.driver.name);


      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("❌ Error fetching drivers: $e");
      return [];
    }
  }

  /// 🔹 Update driver’s online/offline/busy status
  Future<void> updateDriverStatus(String driverId, UserStatus status) async {
    try {
      await _usersRef.doc(driverId).update({'status': status.name});
      print("✅ Updated driver status to ${status.name}");
    } catch (e) {
      print("❌ Error updating driver status: $e");
    }
  }


  /// 🔹 Stream driver info in real-time (for profile/status updates)
  Stream<AppUser?> streamDriver(String driverId) {
    return _usersRef.doc(driverId).snapshots().map((snapshot) {
      if (!snapshot.exists) return null;
      return AppUser.fromMap(snapshot.data() as Map<String, dynamic>);
    });
  }

  /// 🔹 Stream all online drivers in real-time (for map/dispatch)
  Stream<List<AppUser>> streamOnlineDrivers() {
    return _usersRef
        .where('type', isEqualTo: AppUserType.driver.name)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  /// 🔹 Upload driver profile image
  Future<String?> uploadProfileImage(String driverId, File imageFile) async {
    try {
      final ref = _storage.ref().child("drivers/$driverId/profile.jpg");
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await _usersRef.doc(driverId).update({'profileImageUrl': url});
      print("✅ Driver profile image uploaded");
      return url;
    } catch (e) {
      print("❌ Error uploading driver image: $e");
      return null;
    }
  }

  /// 🔹 Update driver location (string or coordinate data)
  Future<void> updateDriverLocation(String driverId, String location) async {
    try {
      await _usersRef.doc(driverId).update({'location': location});
      print("✅ Updated driver location");
    } catch (e) {
      print("❌ Error updating driver location: $e");
    }
  }

  /// 🔹 Delete driver account (admin-only or deactivation)
  Future<void> deleteDriver(String driverId) async {
    try {
      await _usersRef.doc(driverId).delete();
      print("🗑️ Driver deleted: $driverId");
    } catch (e) {
      print("❌ Error deleting driver: $e");
    }
  }
}
