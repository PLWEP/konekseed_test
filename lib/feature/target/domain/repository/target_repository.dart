import 'package:fpdart/fpdart.dart';
import 'package:konekseed_test/common/failure.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';

abstract class TargetRepository {
  Future<Either<Failure, void>> addTarget(Target target);
  Future<Either<Failure, List<Target>>> fetchUserTarget(String uid);
  Future<Either<Failure, void>> deleteTarget(String targetId);
  Future<Either<Failure, void>> editTarget(Target target);
}
