import 'package:flutter/material.dart';

import 'app_colors.dart';

String _appTheme = "lightCode";
AppColor get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, AppColor> _supportedCustomColor = {
    'lightCode': AppColor()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the AppColor instance for the current theme.
  AppColor _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? AppColor();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    final colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the current AppColor instance.
  AppColor themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}


