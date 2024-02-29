import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<Either<Failure, void>> execute(
    String email,
    String password,
  ) {
    return repository.signInWithEmail(email, password);
  }
}
