import 'package:equatable/equatable.dart';

class PhoneNumber extends Equatable {
  String ddd;
  String number;

  PhoneNumber({required this.ddd, required this.number});

  @override
  List<Object?> get props => [ddd, number];
}

class User {
  final PhoneNumber phoneNumber;

  User({required this.phoneNumber});
}
