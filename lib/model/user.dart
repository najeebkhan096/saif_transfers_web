class UserModel {
  String name;
  String email;
  String phone;
  String company;
  String address;
  String password;
  bool marketingEmails;
  bool bookingEmail;
  bool bookingSMS;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.address,
    required this.password,
    this.marketingEmails = true,
    this.bookingEmail = true,
    this.bookingSMS = true,
  });
}
