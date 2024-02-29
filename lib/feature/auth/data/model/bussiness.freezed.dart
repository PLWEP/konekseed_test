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
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  List<String> get sector => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BussinessCopyWith<Bussiness> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BussinessCopyWith<$Res> {
  factory $BussinessCopyWith(Bussiness value, $Res Function(Bussiness) then) =
      _$BussinessCopyWithImpl<$Res, Bussiness>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String logo,
      List<String> sector,
      String value});
}

/// @nodoc
class _$BussinessCopyWithImpl<$Res, $Val extends Bussiness>
    implements $BussinessCopyWith<$Res> {
  _$BussinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? logo = null,
    Object? sector = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as List<String>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BussinessImplCopyWith<$Res>
    implements $BussinessCopyWith<$Res> {
  factory _$$BussinessImplCopyWith(
          _$BussinessImpl value, $Res Function(_$BussinessImpl) then) =
      __$$BussinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String logo,
      List<String> sector,
      String value});
}

/// @nodoc
class __$$BussinessImplCopyWithImpl<$Res>
    extends _$BussinessCopyWithImpl<$Res, _$BussinessImpl>
    implements _$$BussinessImplCopyWith<$Res> {
  __$$BussinessImplCopyWithImpl(
      _$BussinessImpl _value, $Res Function(_$BussinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? logo = null,
    Object? sector = null,
    Object? value = null,
  }) {
    return _then(_$BussinessImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value._sector
          : sector // ignore: cast_nullable_to_non_nullable
              as List<String>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BussinessImpl implements _Bussiness {
  _$BussinessImpl(
      {required this.uid,
      required this.name,
      required this.logo,
      required final List<String> sector,
      required this.value})
      : _sector = sector;

  factory _$BussinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$BussinessImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String logo;
  final List<String> _sector;
  @override
  List<String> get sector {
    if (_sector is EqualUnmodifiableListView) return _sector;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sector);
  }

  @override
  final String value;

  @override
  String toString() {
    return 'Bussiness(uid: $uid, name: $name, logo: $logo, sector: $sector, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BussinessImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            const DeepCollectionEquality().equals(other._sector, _sector) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, logo,
      const DeepCollectionEquality().hash(_sector), value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BussinessImplCopyWith<_$BussinessImpl> get copyWith =>
      __$$BussinessImplCopyWithImpl<_$BussinessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BussinessImplToJson(
      this,
    );
  }
}

abstract class _Bussiness implements Bussiness {
  factory _Bussiness(
      {required final String uid,
      required final String name,
      required final String logo,
      required final List<String> sector,
      required final String value}) = _$BussinessImpl;

  factory _Bussiness.fromJson(Map<String, dynamic> json) =
      _$BussinessImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get logo;
  @override
  List<String> get sector;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$BussinessImplCopyWith<_$BussinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
