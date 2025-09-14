class DriversTableConfig {
  static const double checkbox = 50;
  static const double firstName = 200;
  static const double lastName = 200;
  static const double birthDate = 300;
  static const double state = 200;
  static const double homeLocation = 300;
  static const double workLocation = 300;

  static double get totalWidth =>
      checkbox + firstName + lastName + birthDate + state +
          homeLocation + workLocation ;
}
