// import 'package:flutter/material.dart';
//
// /// These are the reference values based on your Figma design
// const num figmaDesignWidth = 393;
// const num figmaDesignHeight = 852;
// const num figmaDesignStatusBar = 0;
//
// /// Extension for responsive values using width and height
// extension ResponsiveExtension on num {
//   double get _screenWidth => SizeUtils.width;
//   double get _screenHeight => SizeUtils.height;
//
//   /// Horizontal scaling (based on width)
//   double get w => (this * _screenWidth) / figmaDesignWidth;
//
//   /// Vertical scaling (based on height)
//   double get h => (this * _screenHeight) / figmaDesignHeight;
//
//   /// Font scaling (based on width)
//   double get fSize => (this * _screenWidth) / figmaDesignWidth;
// }
//
// /// Formatting and utility extension for double
// extension FormatExtension on double {
//   double toDoubleValue({int fractionDigits = 2}) {
//     return double.parse(toStringAsFixed(fractionDigits));
//   }
//
//   double isNonZero({num defaultValue = 0.0}) {
//     return this > 0 ? this : defaultValue.toDouble();
//   }
// }
//
// /// Enum for device type classification
// enum DeviceType { mobile, tablet, desktop }
//
// /// Builder type alias for responsive widgets
// typedef ResponsiveBuild = Widget Function(
//     BuildContext context,
//     Orientation orientation,
//     DeviceType deviceType,
//     );
//
// /// A widget that provides responsive layout using Orientation and Constraints
// class Sizer extends StatelessWidget {
//   const Sizer({super.key, required this.builder});
//
//   final ResponsiveBuild builder;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return OrientationBuilder(
//           builder: (context, orientation) {
//             SizeUtils.setScreenSize(constraints, orientation);
//             return builder(context, orientation, SizeUtils.deviceType);
//           },
//         );
//       },
//     );
//   }
// }
//
// /// Utility class for managing responsive layout state
// class SizeUtils {
//   static late BoxConstraints boxConstraints;
//   static late Orientation orientation;
//   static late DeviceType deviceType;
//   static late double width;
//   static late double height;
//
//   static void setScreenSize(
//       BoxConstraints constraints,
//       Orientation currentOrientation,
//       ) {
//     boxConstraints = constraints;
//     orientation = currentOrientation;
//
//     if (orientation == Orientation.portrait) {
//       width = boxConstraints.maxWidth.isNonZero(defaultValue: figmaDesignWidth);
//       height = boxConstraints.maxHeight.isNonZero(defaultValue: figmaDesignHeight);
//     } else {
//       width = boxConstraints.maxHeight.isNonZero(defaultValue: figmaDesignWidth);
//       height = boxConstraints.maxWidth.isNonZero(defaultValue: figmaDesignHeight);
//     }
//
//     _setDeviceType();
//   }
//
//   static void _setDeviceType() {
//     if (width >= 950) {
//       deviceType = DeviceType.desktop;
//     } else if (width >= 600) {
//       deviceType = DeviceType.tablet;
//     } else {
//       deviceType = DeviceType.mobile;
//     }
//   }
// }
