// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_body_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeterBodyDto _$MeterBodyDtoFromJson(Map<String, dynamic> json) {
  return _MeterBody.fromJson(json);
}

/// @nodoc
mixin _$MeterBodyDto {
  int get idObject => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeterBodyDtoCopyWith<MeterBodyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeterBodyDtoCopyWith<$Res> {
  factory $MeterBodyDtoCopyWith(
          MeterBodyDto value, $Res Function(MeterBodyDto) then) =
      _$MeterBodyDtoCopyWithImpl<$Res, MeterBodyDto>;
  @useResult
  $Res call({int idObject, DateTime date});
}

/// @nodoc
class _$MeterBodyDtoCopyWithImpl<$Res, $Val extends MeterBodyDto>
    implements $MeterBodyDtoCopyWith<$Res> {
  _$MeterBodyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idObject = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      idObject: null == idObject
          ? _value.idObject
          : idObject // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeterBodyImplCopyWith<$Res>
    implements $MeterBodyDtoCopyWith<$Res> {
  factory _$$MeterBodyImplCopyWith(
          _$MeterBodyImpl value, $Res Function(_$MeterBodyImpl) then) =
      __$$MeterBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idObject, DateTime date});
}

/// @nodoc
class __$$MeterBodyImplCopyWithImpl<$Res>
    extends _$MeterBodyDtoCopyWithImpl<$Res, _$MeterBodyImpl>
    implements _$$MeterBodyImplCopyWith<$Res> {
  __$$MeterBodyImplCopyWithImpl(
      _$MeterBodyImpl _value, $Res Function(_$MeterBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idObject = null,
    Object? date = null,
  }) {
    return _then(_$MeterBodyImpl(
      idObject: null == idObject
          ? _value.idObject
          : idObject // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeterBodyImpl implements _MeterBody {
  const _$MeterBodyImpl({required this.idObject, required this.date});

  factory _$MeterBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeterBodyImplFromJson(json);

  @override
  final int idObject;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'MeterBodyDto(idObject: $idObject, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeterBodyImpl &&
            (identical(other.idObject, idObject) ||
                other.idObject == idObject) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idObject, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeterBodyImplCopyWith<_$MeterBodyImpl> get copyWith =>
      __$$MeterBodyImplCopyWithImpl<_$MeterBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeterBodyImplToJson(
      this,
    );
  }
}

abstract class _MeterBody implements MeterBodyDto {
  const factory _MeterBody(
      {required final int idObject,
      required final DateTime date}) = _$MeterBodyImpl;

  factory _MeterBody.fromJson(Map<String, dynamic> json) =
      _$MeterBodyImpl.fromJson;

  @override
  int get idObject;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$MeterBodyImplCopyWith<_$MeterBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
