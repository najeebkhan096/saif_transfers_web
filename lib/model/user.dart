

import '../enum/gender.dart';
import '../enum/user_status.dart';
import '../enum/user_type.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final String phone;
  final AppUserType type;

  // New fields
  final String location;
  final DateTime createdAt;
  final String profileImageUrl;
  final UserStatus status;
  final Gender gender;   // ✅ Added

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    this.location = '',
    DateTime? createdAt,
    this.profileImageUrl = '',
    this.status = UserStatus.offline,
    this.gender = Gender.none,  // ✅ Default
  }) : createdAt = createdAt ?? DateTime.now();

  // ✅ copyWith method
  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    AppUserType? type,
    String? location,
    DateTime? createdAt,
    String? profileImageUrl,
    UserStatus? status,
    Gender? gender,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'type': type.name,
      'location': location,
      'createdAt': createdAt.toIso8601String(),
      'profileImageUrl': profileImageUrl,
      'status': status.name,
      'gender': gender.name, // ✅ Added
    };
  }

  // Convert from Firestore
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      type: AppUserType.values.firstWhere(
            (e) => e.name == map['type'],
        orElse: () => AppUserType.rider,
      ),
      location: map['location'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      profileImageUrl: map['profileImageUrl'] ?? '',
      status: UserStatus.values.firstWhere(
            (e) => e.name == map['status'],
        orElse: () => UserStatus.offline,
      ),
      gender: Gender.values.firstWhere(
            (g) => g.name == (map['gender'] ?? 'none'),
        orElse: () => Gender.none,
      ), // ✅ Added
    );
  }
}
