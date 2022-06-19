import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_smells/bloaters/primitive_obserssion/value_objects/object_failure.dart';

abstract class ValueObject<T> extends Equatable {
  Either<Failure, T> get value;

  bool get isValid => value.isRight();

  get getOrCrash => value.fold((l) => l, (r) => r);

  @override
  List<Object?> get props => [value];

  // @override
  // bool operator ==(Object other) {
  //   print('checking equals');
  //   print('identical ${identical(this, other)}');
  //   print('other is ValueObject ${other is ValueObject}');
  //   print(
  //       'runtimeType == other.runtimeType ${runtimeType == other.runtimeType}');
  //   print(
  //       'getOrCrash == other.getOrCrash ${other is ValueObject && getOrCrash == other.getOrCrash}');

  //   return identical(this, other) ||
  //       other is ValueObject &&
  //           runtimeType == other.runtimeType &&
  //           getOrCrash == other.getOrCrash;
  // }

  // @override
  // int get hashCode => getOrCrash.hashCode;
}
