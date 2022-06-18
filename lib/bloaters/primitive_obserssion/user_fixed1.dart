class PhoneNumber {
  String ddd;
  String number;

  PhoneNumber({required this.ddd, required this.number});
}

class User {
  final PhoneNumber phoneNumber;

  User({required this.phoneNumber});
}
