import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Either<Failure, User?> execute() => repository.getCurrentUser();
}
