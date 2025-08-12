/// Booking model class for strong typing and maintainability
class Booking {
  final String name;
  final String phone;
  final String car;
  final String date;
  final String time;
  final String start;
  final String end;
  final String income;
  final String avatarUrl;

  Booking({
    required this.name,
    required this.phone,
    required this.car,
    required this.date,
    required this.time,
    required this.start,
    required this.end,
    required this.income,
    required this.avatarUrl,
  });
}
