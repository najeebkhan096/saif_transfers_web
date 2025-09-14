/// ---------------------------
/// Shared column widths
/// ---------------------------
class ClientTableConfig {
  static const double checkbox = 50;
  static const double customer = 250;
  static const double totalRides = 160;
  static const double totalFinished = 200;
  static const double homeLocation = 300;
  static const double workLocation = 300;
  static const double actions = 120; // Edit/Delete column

  static double get totalWidth =>
      checkbox + customer + totalRides + totalFinished + homeLocation + workLocation + actions;
}
