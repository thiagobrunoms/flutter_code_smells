import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_smells/bloaters/primitive_obserssion/value_objects/object_failure.dart';

abstract class ValueObject<T> extends Equatable {
  Either<Failure, T> get value;

  bool get isValid => value.isRight();

  get getOrCrash => value.fold((l) => l, (r) => r);

  @override
  List<Object?> get props => [value];
}
