import 'package:freezed_annotation/freezed_annotation.dart';

part 'target.freezed.dart';
part 'target.g.dart';

@freezed
class Target with _$Target {
  factory Target({
    required String id,
    required String uid,
    required String name,
    required String category,
    required int weight,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) = _Target;

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}
