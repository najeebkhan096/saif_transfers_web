import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String _activeItem = 'Home';

  String get activeItem => _activeItem;

  void setActiveItem(String item) {
    if (_activeItem != item) {
      _activeItem = item;
      notifyListeners();
    }
  }
}
