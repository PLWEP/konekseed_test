import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/target/domain/repository/target_repository.dart';

class DeleteTarget {
  final TargetRepository repository;

  DeleteTarget(this.repository);

  Future<Either<Failure, void>> execute(String targetId) {
    return repository.deleteTarget(targetId);
  }
}
