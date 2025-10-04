import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../enum/user_type.dart';
import '../model/user.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _appUser;
  User? _firebaseUser;
  bool _isLoading = false;
  String? _errorMessage;

  AppUser? get appUser => _appUser;
  User? get firebaseUser => _firebaseUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AppUserType get userType => _appUser?.type ?? AppUserType.none;
  bool get isLoggedIn => _firebaseUser != null;
  bool get isAdmin => _appUser?.type == AppUserType.admin;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Initialize user on app start
  Future<void> initialize() async {
    _setLoading(true);
    try {
      _firebaseUser = _auth.currentUser;
      if (_firebaseUser != null) {
        _appUser = await _userService.getUserByUid(_firebaseUser!.uid);
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      _firebaseUser = await _userService.login(email, password);
      if (_firebaseUser != null) {
        _appUser = await _userService.getUserByUid(_firebaseUser!.uid);
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _userService.logout();
      _firebaseUser = null;
      _appUser = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }
}
