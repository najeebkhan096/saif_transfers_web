class ClientModel {
  final String name;
  final String phone;
  final String avatar;
  final String totalRides;
  final String totalFinished;
  final String homeLocation;
  final String workLocation;

  const ClientModel({
    required this.name,
    required this.phone,
    required this.avatar,
    required this.totalRides,
    required this.totalFinished,
    required this.homeLocation,
    required this.workLocation,
  });

  /// Optional: Create from JSON / Map
  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      avatar: map['avatar'] ?? '',
      totalRides: map['totalRides'] ?? '',
      totalFinished: map['totalFinished'] ?? '',
      homeLocation: map['homeLocation'] ?? '',
      workLocation: map['workLocation'] ?? '',
    );
  }

  /// Optional: Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'totalRides': totalRides,
      'totalFinished': totalFinished,
      'homeLocation': homeLocation,
      'workLocation': workLocation,
    };
  }
}
