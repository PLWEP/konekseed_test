// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bussiness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bussiness _$BussinessFromJson(Map<String, dynamic> json) {
  return _Bussiness.fromJson(json);
}

/// @nodoc
mixin _$Bussiness {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BussinessCopyWith<$Res> {
  factory $BussinessCopyWith(Bussiness value, $Res Function(Bussiness) then) =
      _$BussinessCopyWithImpl<$Res, Bussiness>;
}

/// @nodoc
class _$BussinessCopyWithImpl<$Res, $Val extends Bussiness>
    implements $BussinessCopyWith<$Res> {
  _$BussinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BussinessImplCopyWith<$Res> {
  factory _$$BussinessImplCopyWith(
          _$BussinessImpl value, $Res Function(_$BussinessImpl) then) =
      __$$BussinessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BussinessImplCopyWithImpl<$Res>
    extends _$BussinessCopyWithImpl<$Res, _$BussinessImpl>
    implements _$$BussinessImplCopyWith<$Res> {
  __$$BussinessImplCopyWithImpl(
      _$BussinessImpl _value, $Res Function(_$BussinessImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$BussinessImpl implements _Bussiness {
  _$BussinessImpl();

  factory _$BussinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$BussinessImplFromJson(json);

  @override
  String toString() {
    return 'Bussiness()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BussinessImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$BussinessImplToJson(
      this,
    );
  }
}

abstract class _Bussiness implements Bussiness {
  factory _Bussiness() = _$BussinessImpl;

  factory _Bussiness.fromJson(Map<String, dynamic> json) =
      _$BussinessImpl.fromJson;
}
