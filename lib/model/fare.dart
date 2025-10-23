import 'package:cloud_firestore/cloud_firestore.dart';

class Fare {
  final String id;
  final String name;
  final double baseFare;
  final double perKm;
  final double perMinute;
  final double minFare;
  final double cancellationFee;
  final bool isActive;
  final String? photoUrl;
  final DateTime? createdAt;

  Fare({
    required this.id,
    required this.name,
    required this.baseFare,
    required this.perKm,
    required this.perMinute,
    required this.minFare,
    required this.cancellationFee,
    required this.isActive,
    this.photoUrl,
    this.createdAt,
  });

  /// Convert Firestore document → Fare object
  factory Fare.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Fare(
      id: doc.id,
      name: data['name'] ?? '',
      baseFare: (data['baseFare'] ?? 0).toDouble(),
      perKm: (data['perKm'] ?? 0).toDouble(),
      perMinute: (data['perMinute'] ?? 0).toDouble(),
      minFare: (data['minFare'] ?? 0).toDouble(),
      cancellationFee: (data['cancellationFee'] ?? 0).toDouble(),
      isActive: data['isActive'] ?? true,
      photoUrl: data['photoUrl'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  /// Convert Fare → JSON for Firestore
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "baseFare": baseFare,
      "perKm": perKm,
      "perMinute": perMinute,
      "minFare": minFare,
      "cancellationFee": cancellationFee,
      "isActive": isActive,
      "photoUrl": photoUrl,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
    };
  }

}
