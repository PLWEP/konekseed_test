import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';
import 'package:konekseed_test/feature/target/domain/repository/target_repository.dart';

class FetchUserTarget {
  final TargetRepository repository;

  FetchUserTarget(this.repository);

  Future<Either<Failure, List<Target>>> execute(String uid) {
    return repository.fetchUserTarget(uid);
  }
}
