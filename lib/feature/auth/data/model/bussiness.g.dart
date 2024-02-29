// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bussiness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BussinessImpl _$$BussinessImplFromJson(Map<String, dynamic> json) =>
    _$BussinessImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      sector:
          (json['sector'] as List<dynamic>).map((e) => e as String).toList(),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$BussinessImplToJson(_$BussinessImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'logo': instance.logo,
      'sector': instance.sector,
      'value': instance.value,
    };
