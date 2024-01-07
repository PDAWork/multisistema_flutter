// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_meter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeMeterDto _$TypeMeterDtoFromJson(Map<String, dynamic> json) {
  return _TypeMeterDtom.fromJson(json);
}

/// @nodoc
mixin _$TypeMeterDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeMeterDtoCopyWith<TypeMeterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeMeterDtoCopyWith<$Res> {
  factory $TypeMeterDtoCopyWith(
          TypeMeterDto value, $Res Function(TypeMeterDto) then) =
      _$TypeMeterDtoCopyWithImpl<$Res, TypeMeterDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TypeMeterDtoCopyWithImpl<$Res, $Val extends TypeMeterDto>
    implements $TypeMeterDtoCopyWith<$Res> {
  _$TypeMeterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeMeterDtomImplCopyWith<$Res>
    implements $TypeMeterDtoCopyWith<$Res> {
  factory _$$TypeMeterDtomImplCopyWith(
          _$TypeMeterDtomImpl value, $Res Function(_$TypeMeterDtomImpl) then) =
      __$$TypeMeterDtomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$TypeMeterDtomImplCopyWithImpl<$Res>
    extends _$TypeMeterDtoCopyWithImpl<$Res, _$TypeMeterDtomImpl>
    implements _$$TypeMeterDtomImplCopyWith<$Res> {
  __$$TypeMeterDtomImplCopyWithImpl(
      _$TypeMeterDtomImpl _value, $Res Function(_$TypeMeterDtomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TypeMeterDtomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeMeterDtomImpl implements _TypeMeterDtom {
  const _$TypeMeterDtomImpl({required this.id, required this.name});

  factory _$TypeMeterDtomImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeMeterDtomImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'TypeMeterDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeMeterDtomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeMeterDtomImplCopyWith<_$TypeMeterDtomImpl> get copyWith =>
      __$$TypeMeterDtomImplCopyWithImpl<_$TypeMeterDtomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeMeterDtomImplToJson(
      this,
    );
  }
}

abstract class _TypeMeterDtom implements TypeMeterDto {
  const factory _TypeMeterDtom(
      {required final int id,
      required final String name}) = _$TypeMeterDtomImpl;

  factory _TypeMeterDtom.fromJson(Map<String, dynamic> json) =
      _$TypeMeterDtomImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TypeMeterDtomImplCopyWith<_$TypeMeterDtomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
