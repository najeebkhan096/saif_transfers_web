// lib/enum/gender.dart
enum Gender {
  none,
  male,
  female,
  other,
}

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      case Gender.other:
        return "Other";
      case Gender.none:
      default:
        return "None";
    }
  }

  static Gender fromString(String value) {
    switch (value.toLowerCase()) {
      case "male":
        return Gender.male;
      case "female":
        return Gender.female;
      case "other":
        return Gender.other;
      case "none":
      default:
        return Gender.none;
    }
  }
}
