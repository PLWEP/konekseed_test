import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';
import 'package:konekseed_test/feature/target/domain/repository/target_repository.dart';

class EditTarget {
  final TargetRepository repository;

  EditTarget(this.repository);

  Future<Either<Failure, void>> execute(Target target) {
    return repository.editTarget(target);
  }
}
