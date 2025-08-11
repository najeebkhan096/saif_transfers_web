/// ---------------------------
/// Shared column widths
/// ---------------------------
class BookingTableConfig {
  static const double checkbox = 50;
  static const double customer = 250;
  static const double car = 160;
  static const double dateTime = 200;
  static const double start = 300;
  static const double end = 300;
  static const double income = 300;

  static double get totalWidth =>
      checkbox + customer + car + dateTime + start + end + income;
}
