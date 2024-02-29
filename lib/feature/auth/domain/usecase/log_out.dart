import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/auth/domain/repository/auth_repository.dart';

class LogOut {
  final AuthRepository repository;

  LogOut(this.repository);

  Future<Either<Failure, void>> execute() {
    return repository.logOut();
  }
}
