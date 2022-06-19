import 'package:equatable/equatable.dart';

class PhoneNumber extends Equatable {
  final String ddd;
  final String number;

  const PhoneNumber({required this.ddd, required this.number});

  @override
  List<Object?> get props => [ddd, number];
}

class User {
  final PhoneNumber phoneNumber;

  User({required this.phoneNumber});
}
