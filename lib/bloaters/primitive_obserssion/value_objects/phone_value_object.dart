import 'package:dartz/dartz.dart';
import 'package:flutter_code_smells/bloaters/primitive_obserssion/user_fixed1.dart';
import 'package:flutter_code_smells/bloaters/primitive_obserssion/value_objects/phone_failure.dart';
import 'package:flutter_code_smells/bloaters/primitive_obserssion/value_objects/value_object.dart';

class PhoneValueObject extends ValueObject<PhoneNumber> {
  @override
  final Either<PhoneFailure, PhoneNumber> value;

  PhoneValueObject._(this.value);

  factory PhoneValueObject.fromString(String ddd, String phone) {
    return PhoneValueObject._(validatePhone(ddd, phone));
  }

  static Either<PhoneFailure, PhoneNumber> validatePhone(
      String ddd, String phone) {
    if (ddd.isEmpty) {
      return left(PhoneFailure(message: "Telefone inválido!"));
    }

    return right(PhoneNumber(ddd: ddd, number: phone));
  }
}

void main() {
  PhoneValueObject phone = PhoneValueObject.fromString("82", "9999431690");
  PhoneValueObject phone2 = PhoneValueObject.fromString("82", "9999431690");

  if (phone.isValid) {
    print(phone.getOrCrash);
  } else {
    print(phone.getOrCrash.message);
  }

  if (phone == phone2) {
    print('They are equals!!');
  } else {
    print('They are not equals!');
  }
}
