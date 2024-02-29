import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class RegisterWithEmail {
  final AuthRepository repository;

  RegisterWithEmail(this.repository);

  Future<Either<Failure, void>> execute(
    String email,
    String password,
    String name,
    List<String> sector,
    String value,
    File logo,
  ) {
    return repository.registerWithEmail(
      email,
      password,
      name,
      sector,
      value,
      logo,
    );
  }
}
