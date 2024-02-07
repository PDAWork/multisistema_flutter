// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateDto _$StateDtoFromJson(Map<String, dynamic> json) {
  return _StateDto.fromJson(json);
}

/// @nodoc
mixin _$StateDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateDtoCopyWith<StateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDtoCopyWith<$Res> {
  factory $StateDtoCopyWith(StateDto value, $Res Function(StateDto) then) =
      _$StateDtoCopyWithImpl<$Res, StateDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$StateDtoCopyWithImpl<$Res, $Val extends StateDto>
    implements $StateDtoCopyWith<$Res> {
  _$StateDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$StateDtoImplCopyWith<$Res>
    implements $StateDtoCopyWith<$Res> {
  factory _$$StateDtoImplCopyWith(
          _$StateDtoImpl value, $Res Function(_$StateDtoImpl) then) =
      __$$StateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$StateDtoImplCopyWithImpl<$Res>
    extends _$StateDtoCopyWithImpl<$Res, _$StateDtoImpl>
    implements _$$StateDtoImplCopyWith<$Res> {
  __$$StateDtoImplCopyWithImpl(
      _$StateDtoImpl _value, $Res Function(_$StateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$StateDtoImpl(
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
class _$StateDtoImpl implements _StateDto {
  const _$StateDtoImpl({required this.id, required this.name});

  factory _$StateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'StateDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateDtoImplCopyWith<_$StateDtoImpl> get copyWith =>
      __$$StateDtoImplCopyWithImpl<_$StateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateDtoImplToJson(
      this,
    );
  }
}

abstract class _StateDto implements StateDto {
  const factory _StateDto({required final int id, required final String name}) =
      _$StateDtoImpl;

  factory _StateDto.fromJson(Map<String, dynamic> json) =
      _$StateDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$StateDtoImplCopyWith<_$StateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
