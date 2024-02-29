
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bussiness.freezed.dart';
part 'bussiness.g.dart';

@freezed
class Bussiness with _$Bussiness {
  factory Bussiness() = _Bussiness;
	
  factory Bussiness.fromJson(Map<String, dynamic> json) =>
			_$BussinessFromJson(json);
}
