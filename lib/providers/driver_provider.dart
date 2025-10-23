import 'package:flutter/foundation.dart';
import '../model/driver.dart';
import '../services/driver_service.dart';

class DriverProvider with ChangeNotifier {
  final DriverService _driverService = DriverService();

  List<DriverModel> _drivers = [];
  List<DriverModel> get drivers => _drivers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDrivers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final driverList = await _driverService.getAllDrivers();
      _drivers = driverList
          .map(
            (d) => DriverModel(
              firstName: d.name,
              lastName: '',
              birthDate: '',
              state: '',
              homeLocation: d.location ?? '',
              workLocation: d.location ?? '',
              income: 2440,
              orders: 23,
              avatar:
                  d.profileImageUrl ??
                  "https://via.placeholder.com/150", // fallback
            ),
          )
          .toList();
      ;
    } catch (e) {
      debugPrint("❌ Error fetching drivers: $e");
      _drivers = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void filterDrivers(String query) {
    if (query.isEmpty) {
      fetchDrivers(); // reset to all
    } else {
      _drivers = _drivers
          .where(
            (d) =>
                d.firstName.toLowerCase().contains(query.toLowerCase()) ||
                d.lastName.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      notifyListeners();
    }
  }
}
