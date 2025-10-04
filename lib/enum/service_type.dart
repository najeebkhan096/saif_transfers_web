/// Types of ride services offered
enum ServiceType {
  business,
  electric,
  suv,
  first,
}

/// Extension to add display labels
extension ServiceTypeExtension on ServiceType {
  String get displayName {
    switch (this) {
      case ServiceType.business:
        return "Business Class";
      case ServiceType.electric:
        return "Electric Class";
      case ServiceType.suv:
        return "Business Van / SUV Class";
      case ServiceType.first:
        return "First Class";
    }
  }

  /// Optionally: associate an asset/icon for each service type
  String get imageAsset {
    switch (this) {
      case ServiceType.business:
        return "assets/images/services/business.png";
      case ServiceType.electric:
        return "assets/images/services/electric.png";
      case ServiceType.suv:
        return "assets/images/services/suv.png";
      case ServiceType.first:
        return "assets/images/services/firstclass.png";
    }
  }

  /// Optionally: base fare defaults (could later come from API)
  double get baseFare {
    switch (this) {
      case ServiceType.business:
        return 5.0;
      case ServiceType.electric:
        return 6.0;
      case ServiceType.suv:
        return 8.0;
      case ServiceType.first:
        return 12.0;
    }
  }
}
