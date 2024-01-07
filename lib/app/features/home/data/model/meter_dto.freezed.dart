// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeterDto _$MeterDtoFromJson(Map<String, dynamic> json) {
  return _MeterDto.fromJson(json);
}

/// @nodoc
mixin _$MeterDto {
  int get id => throw _privateConstructorUsedError;
  String get meterName => throw _privateConstructorUsedError;
  String get snMeter => throw _privateConstructorUsedError;
  String get eircNum => throw _privateConstructorUsedError;
  String? get infoText => throw _privateConstructorUsedError;
  @JsonKey(name: "TypeMeter")
  TypeMeterDto get typeMeter => throw _privateConstructorUsedError;
  @JsonKey(name: "State")
  StateDto? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "MetersVals")
  List<double> get metersVals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeterDtoCopyWith<MeterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeterDtoCopyWith<$Res> {
  factory $MeterDtoCopyWith(MeterDto value, $Res Function(MeterDto) then) =
      _$MeterDtoCopyWithImpl<$Res, MeterDto>;
  @useResult
  $Res call(
      {int id,
      String meterName,
      String snMeter,
      String eircNum,
      String? infoText,
      @JsonKey(name: "TypeMeter") TypeMeterDto typeMeter,
      @JsonKey(name: "State") StateDto? state,
      @JsonKey(name: "MetersVals") List<double> metersVals});

  $TypeMeterDtoCopyWith<$Res> get typeMeter;
  $StateDtoCopyWith<$Res>? get state;
}

/// @nodoc
class _$MeterDtoCopyWithImpl<$Res, $Val extends MeterDto>
    implements $MeterDtoCopyWith<$Res> {
  _$MeterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meterName = null,
    Object? snMeter = null,
    Object? eircNum = null,
    Object? infoText = freezed,
    Object? typeMeter = null,
    Object? state = freezed,
    Object? metersVals = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      meterName: null == meterName
          ? _value.meterName
          : meterName // ignore: cast_nullable_to_non_nullable
              as String,
      snMeter: null == snMeter
          ? _value.snMeter
          : snMeter // ignore: cast_nullable_to_non_nullable
              as String,
      eircNum: null == eircNum
          ? _value.eircNum
          : eircNum // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: freezed == infoText
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeMeter: null == typeMeter
          ? _value.typeMeter
          : typeMeter // ignore: cast_nullable_to_non_nullable
              as TypeMeterDto,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDto?,
      metersVals: null == metersVals
          ? _value.metersVals
          : metersVals // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeMeterDtoCopyWith<$Res> get typeMeter {
    return $TypeMeterDtoCopyWith<$Res>(_value.typeMeter, (value) {
      return _then(_value.copyWith(typeMeter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateDtoCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateDtoCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeterDtoImplCopyWith<$Res>
    implements $MeterDtoCopyWith<$Res> {
  factory _$$MeterDtoImplCopyWith(
          _$MeterDtoImpl value, $Res Function(_$MeterDtoImpl) then) =
      __$$MeterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String meterName,
      String snMeter,
      String eircNum,
      String? infoText,
      @JsonKey(name: "TypeMeter") TypeMeterDto typeMeter,
      @JsonKey(name: "State") StateDto? state,
      @JsonKey(name: "MetersVals") List<double> metersVals});

  @override
  $TypeMeterDtoCopyWith<$Res> get typeMeter;
  @override
  $StateDtoCopyWith<$Res>? get state;
}

/// @nodoc
class __$$MeterDtoImplCopyWithImpl<$Res>
    extends _$MeterDtoCopyWithImpl<$Res, _$MeterDtoImpl>
    implements _$$MeterDtoImplCopyWith<$Res> {
  __$$MeterDtoImplCopyWithImpl(
      _$MeterDtoImpl _value, $Res Function(_$MeterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meterName = null,
    Object? snMeter = null,
    Object? eircNum = null,
    Object? infoText = freezed,
    Object? typeMeter = null,
    Object? state = freezed,
    Object? metersVals = null,
  }) {
    return _then(_$MeterDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      meterName: null == meterName
          ? _value.meterName
          : meterName // ignore: cast_nullable_to_non_nullable
              as String,
      snMeter: null == snMeter
          ? _value.snMeter
          : snMeter // ignore: cast_nullable_to_non_nullable
              as String,
      eircNum: null == eircNum
          ? _value.eircNum
          : eircNum // ignore: cast_nullable_to_non_nullable
              as String,
      infoText: freezed == infoText
          ? _value.infoText
          : infoText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeMeter: null == typeMeter
          ? _value.typeMeter
          : typeMeter // ignore: cast_nullable_to_non_nullable
              as TypeMeterDto,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateDto?,
      metersVals: null == metersVals
          ? _value._metersVals
          : metersVals // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeterDtoImpl implements _MeterDto {
  const _$MeterDtoImpl(
      {required this.id,
      required this.meterName,
      required this.snMeter,
      required this.eircNum,
      required this.infoText,
      @JsonKey(name: "TypeMeter") required this.typeMeter,
      @JsonKey(name: "State") required this.state,
      @JsonKey(name: "MetersVals") required final List<double> metersVals})
      : _metersVals = metersVals;

  factory _$MeterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeterDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String meterName;
  @override
  final String snMeter;
  @override
  final String eircNum;
  @override
  final String? infoText;
  @override
  @JsonKey(name: "TypeMeter")
  final TypeMeterDto typeMeter;
  @override
  @JsonKey(name: "State")
  final StateDto? state;
  final List<double> _metersVals;
  @override
  @JsonKey(name: "MetersVals")
  List<double> get metersVals {
    if (_metersVals is EqualUnmodifiableListView) return _metersVals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metersVals);
  }

  @override
  String toString() {
    return 'MeterDto(id: $id, meterName: $meterName, snMeter: $snMeter, eircNum: $eircNum, infoText: $infoText, typeMeter: $typeMeter, state: $state, metersVals: $metersVals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeterDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meterName, meterName) ||
                other.meterName == meterName) &&
            (identical(other.snMeter, snMeter) || other.snMeter == snMeter) &&
            (identical(other.eircNum, eircNum) || other.eircNum == eircNum) &&
            (identical(other.infoText, infoText) ||
                other.infoText == infoText) &&
            (identical(other.typeMeter, typeMeter) ||
                other.typeMeter == typeMeter) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._metersVals, _metersVals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      meterName,
      snMeter,
      eircNum,
      infoText,
      typeMeter,
      state,
      const DeepCollectionEquality().hash(_metersVals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeterDtoImplCopyWith<_$MeterDtoImpl> get copyWith =>
      __$$MeterDtoImplCopyWithImpl<_$MeterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeterDtoImplToJson(
      this,
    );
  }
}

abstract class _MeterDto implements MeterDto {
  const factory _MeterDto(
      {required final int id,
      required final String meterName,
      required final String snMeter,
      required final String eircNum,
      required final String? infoText,
      @JsonKey(name: "TypeMeter") required final TypeMeterDto typeMeter,
      @JsonKey(name: "State") required final StateDto? state,
      @JsonKey(name: "MetersVals")
      required final List<double> metersVals}) = _$MeterDtoImpl;

  factory _MeterDto.fromJson(Map<String, dynamic> json) =
      _$MeterDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get meterName;
  @override
  String get snMeter;
  @override
  String get eircNum;
  @override
  String? get infoText;
  @override
  @JsonKey(name: "TypeMeter")
  TypeMeterDto get typeMeter;
  @override
  @JsonKey(name: "State")
  StateDto? get state;
  @override
  @JsonKey(name: "MetersVals")
  List<double> get metersVals;
  @override
  @JsonKey(ignore: true)
  _$$MeterDtoImplCopyWith<_$MeterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
