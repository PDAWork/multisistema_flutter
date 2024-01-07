// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SensorDto _$SensorDtoFromJson(Map<String, dynamic> json) {
  return _SensorDto.fromJson(json);
}

/// @nodoc
mixin _$SensorDto {
  String get sn => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get ssid => throw _privateConstructorUsedError;
  String? get hardwere => throw _privateConstructorUsedError;
  String? get firmwawe => throw _privateConstructorUsedError;
  int get batery => throw _privateConstructorUsedError;
  String get localip => throw _privateConstructorUsedError;
  int get checkHours => throw _privateConstructorUsedError;
  String? get checkPeriodDipslay => throw _privateConstructorUsedError;
  DateTime get lastConnection => throw _privateConstructorUsedError;
  String? get lastConnectionWarning => throw _privateConstructorUsedError;
  int? get licChennels => throw _privateConstructorUsedError;
  int get requests => throw _privateConstructorUsedError;
  String get rssi => throw _privateConstructorUsedError;
  double get log => throw _privateConstructorUsedError;
  int get scan => throw _privateConstructorUsedError;
  int get vol => throw _privateConstructorUsedError;
  int get send => throw _privateConstructorUsedError;
  DateTime? get readoutDate => throw _privateConstructorUsedError;
  DateTime? get requestDate => throw _privateConstructorUsedError;
  bool get capState => throw _privateConstructorUsedError;
  bool get powerSupply => throw _privateConstructorUsedError;
  bool get emptyInputs => throw _privateConstructorUsedError;
  String get nbiot => throw _privateConstructorUsedError;
  @JsonKey(name: "meters")
  List<MeterDto> get meterList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorDtoCopyWith<SensorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorDtoCopyWith<$Res> {
  factory $SensorDtoCopyWith(SensorDto value, $Res Function(SensorDto) then) =
      _$SensorDtoCopyWithImpl<$Res, SensorDto>;
  @useResult
  $Res call(
      {String sn,
      String name,
      String model,
      bool active,
      String ssid,
      String? hardwere,
      String? firmwawe,
      int batery,
      String localip,
      int checkHours,
      String? checkPeriodDipslay,
      DateTime lastConnection,
      String? lastConnectionWarning,
      int? licChennels,
      int requests,
      String rssi,
      double log,
      int scan,
      int vol,
      int send,
      DateTime? readoutDate,
      DateTime? requestDate,
      bool capState,
      bool powerSupply,
      bool emptyInputs,
      String nbiot,
      @JsonKey(name: "meters") List<MeterDto> meterList});
}

/// @nodoc
class _$SensorDtoCopyWithImpl<$Res, $Val extends SensorDto>
    implements $SensorDtoCopyWith<$Res> {
  _$SensorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sn = null,
    Object? name = null,
    Object? model = null,
    Object? active = null,
    Object? ssid = null,
    Object? hardwere = freezed,
    Object? firmwawe = freezed,
    Object? batery = null,
    Object? localip = null,
    Object? checkHours = null,
    Object? checkPeriodDipslay = freezed,
    Object? lastConnection = null,
    Object? lastConnectionWarning = freezed,
    Object? licChennels = freezed,
    Object? requests = null,
    Object? rssi = null,
    Object? log = null,
    Object? scan = null,
    Object? vol = null,
    Object? send = null,
    Object? readoutDate = freezed,
    Object? requestDate = freezed,
    Object? capState = null,
    Object? powerSupply = null,
    Object? emptyInputs = null,
    Object? nbiot = null,
    Object? meterList = null,
  }) {
    return _then(_value.copyWith(
      sn: null == sn
          ? _value.sn
          : sn // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      hardwere: freezed == hardwere
          ? _value.hardwere
          : hardwere // ignore: cast_nullable_to_non_nullable
              as String?,
      firmwawe: freezed == firmwawe
          ? _value.firmwawe
          : firmwawe // ignore: cast_nullable_to_non_nullable
              as String?,
      batery: null == batery
          ? _value.batery
          : batery // ignore: cast_nullable_to_non_nullable
              as int,
      localip: null == localip
          ? _value.localip
          : localip // ignore: cast_nullable_to_non_nullable
              as String,
      checkHours: null == checkHours
          ? _value.checkHours
          : checkHours // ignore: cast_nullable_to_non_nullable
              as int,
      checkPeriodDipslay: freezed == checkPeriodDipslay
          ? _value.checkPeriodDipslay
          : checkPeriodDipslay // ignore: cast_nullable_to_non_nullable
              as String?,
      lastConnection: null == lastConnection
          ? _value.lastConnection
          : lastConnection // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastConnectionWarning: freezed == lastConnectionWarning
          ? _value.lastConnectionWarning
          : lastConnectionWarning // ignore: cast_nullable_to_non_nullable
              as String?,
      licChennels: freezed == licChennels
          ? _value.licChennels
          : licChennels // ignore: cast_nullable_to_non_nullable
              as int?,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as int,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as double,
      scan: null == scan
          ? _value.scan
          : scan // ignore: cast_nullable_to_non_nullable
              as int,
      vol: null == vol
          ? _value.vol
          : vol // ignore: cast_nullable_to_non_nullable
              as int,
      send: null == send
          ? _value.send
          : send // ignore: cast_nullable_to_non_nullable
              as int,
      readoutDate: freezed == readoutDate
          ? _value.readoutDate
          : readoutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      capState: null == capState
          ? _value.capState
          : capState // ignore: cast_nullable_to_non_nullable
              as bool,
      powerSupply: null == powerSupply
          ? _value.powerSupply
          : powerSupply // ignore: cast_nullable_to_non_nullable
              as bool,
      emptyInputs: null == emptyInputs
          ? _value.emptyInputs
          : emptyInputs // ignore: cast_nullable_to_non_nullable
              as bool,
      nbiot: null == nbiot
          ? _value.nbiot
          : nbiot // ignore: cast_nullable_to_non_nullable
              as String,
      meterList: null == meterList
          ? _value.meterList
          : meterList // ignore: cast_nullable_to_non_nullable
              as List<MeterDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorDtoImplCopyWith<$Res>
    implements $SensorDtoCopyWith<$Res> {
  factory _$$SensorDtoImplCopyWith(
          _$SensorDtoImpl value, $Res Function(_$SensorDtoImpl) then) =
      __$$SensorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sn,
      String name,
      String model,
      bool active,
      String ssid,
      String? hardwere,
      String? firmwawe,
      int batery,
      String localip,
      int checkHours,
      String? checkPeriodDipslay,
      DateTime lastConnection,
      String? lastConnectionWarning,
      int? licChennels,
      int requests,
      String rssi,
      double log,
      int scan,
      int vol,
      int send,
      DateTime? readoutDate,
      DateTime? requestDate,
      bool capState,
      bool powerSupply,
      bool emptyInputs,
      String nbiot,
      @JsonKey(name: "meters") List<MeterDto> meterList});
}

/// @nodoc
class __$$SensorDtoImplCopyWithImpl<$Res>
    extends _$SensorDtoCopyWithImpl<$Res, _$SensorDtoImpl>
    implements _$$SensorDtoImplCopyWith<$Res> {
  __$$SensorDtoImplCopyWithImpl(
      _$SensorDtoImpl _value, $Res Function(_$SensorDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sn = null,
    Object? name = null,
    Object? model = null,
    Object? active = null,
    Object? ssid = null,
    Object? hardwere = freezed,
    Object? firmwawe = freezed,
    Object? batery = null,
    Object? localip = null,
    Object? checkHours = null,
    Object? checkPeriodDipslay = freezed,
    Object? lastConnection = null,
    Object? lastConnectionWarning = freezed,
    Object? licChennels = freezed,
    Object? requests = null,
    Object? rssi = null,
    Object? log = null,
    Object? scan = null,
    Object? vol = null,
    Object? send = null,
    Object? readoutDate = freezed,
    Object? requestDate = freezed,
    Object? capState = null,
    Object? powerSupply = null,
    Object? emptyInputs = null,
    Object? nbiot = null,
    Object? meterList = null,
  }) {
    return _then(_$SensorDtoImpl(
      sn: null == sn
          ? _value.sn
          : sn // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      hardwere: freezed == hardwere
          ? _value.hardwere
          : hardwere // ignore: cast_nullable_to_non_nullable
              as String?,
      firmwawe: freezed == firmwawe
          ? _value.firmwawe
          : firmwawe // ignore: cast_nullable_to_non_nullable
              as String?,
      batery: null == batery
          ? _value.batery
          : batery // ignore: cast_nullable_to_non_nullable
              as int,
      localip: null == localip
          ? _value.localip
          : localip // ignore: cast_nullable_to_non_nullable
              as String,
      checkHours: null == checkHours
          ? _value.checkHours
          : checkHours // ignore: cast_nullable_to_non_nullable
              as int,
      checkPeriodDipslay: freezed == checkPeriodDipslay
          ? _value.checkPeriodDipslay
          : checkPeriodDipslay // ignore: cast_nullable_to_non_nullable
              as String?,
      lastConnection: null == lastConnection
          ? _value.lastConnection
          : lastConnection // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastConnectionWarning: freezed == lastConnectionWarning
          ? _value.lastConnectionWarning
          : lastConnectionWarning // ignore: cast_nullable_to_non_nullable
              as String?,
      licChennels: freezed == licChennels
          ? _value.licChennels
          : licChennels // ignore: cast_nullable_to_non_nullable
              as int?,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as int,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as double,
      scan: null == scan
          ? _value.scan
          : scan // ignore: cast_nullable_to_non_nullable
              as int,
      vol: null == vol
          ? _value.vol
          : vol // ignore: cast_nullable_to_non_nullable
              as int,
      send: null == send
          ? _value.send
          : send // ignore: cast_nullable_to_non_nullable
              as int,
      readoutDate: freezed == readoutDate
          ? _value.readoutDate
          : readoutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      capState: null == capState
          ? _value.capState
          : capState // ignore: cast_nullable_to_non_nullable
              as bool,
      powerSupply: null == powerSupply
          ? _value.powerSupply
          : powerSupply // ignore: cast_nullable_to_non_nullable
              as bool,
      emptyInputs: null == emptyInputs
          ? _value.emptyInputs
          : emptyInputs // ignore: cast_nullable_to_non_nullable
              as bool,
      nbiot: null == nbiot
          ? _value.nbiot
          : nbiot // ignore: cast_nullable_to_non_nullable
              as String,
      meterList: null == meterList
          ? _value._meterList
          : meterList // ignore: cast_nullable_to_non_nullable
              as List<MeterDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorDtoImpl implements _SensorDto {
  const _$SensorDtoImpl(
      {required this.sn,
      required this.name,
      required this.model,
      required this.active,
      required this.ssid,
      required this.hardwere,
      required this.firmwawe,
      required this.batery,
      required this.localip,
      required this.checkHours,
      required this.checkPeriodDipslay,
      required this.lastConnection,
      required this.lastConnectionWarning,
      required this.licChennels,
      required this.requests,
      required this.rssi,
      required this.log,
      required this.scan,
      required this.vol,
      required this.send,
      required this.readoutDate,
      required this.requestDate,
      required this.capState,
      required this.powerSupply,
      required this.emptyInputs,
      required this.nbiot,
      @JsonKey(name: "meters") required final List<MeterDto> meterList})
      : _meterList = meterList;

  factory _$SensorDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorDtoImplFromJson(json);

  @override
  final String sn;
  @override
  final String name;
  @override
  final String model;
  @override
  final bool active;
  @override
  final String ssid;
  @override
  final String? hardwere;
  @override
  final String? firmwawe;
  @override
  final int batery;
  @override
  final String localip;
  @override
  final int checkHours;
  @override
  final String? checkPeriodDipslay;
  @override
  final DateTime lastConnection;
  @override
  final String? lastConnectionWarning;
  @override
  final int? licChennels;
  @override
  final int requests;
  @override
  final String rssi;
  @override
  final double log;
  @override
  final int scan;
  @override
  final int vol;
  @override
  final int send;
  @override
  final DateTime? readoutDate;
  @override
  final DateTime? requestDate;
  @override
  final bool capState;
  @override
  final bool powerSupply;
  @override
  final bool emptyInputs;
  @override
  final String nbiot;
  final List<MeterDto> _meterList;
  @override
  @JsonKey(name: "meters")
  List<MeterDto> get meterList {
    if (_meterList is EqualUnmodifiableListView) return _meterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meterList);
  }

  @override
  String toString() {
    return 'SensorDto(sn: $sn, name: $name, model: $model, active: $active, ssid: $ssid, hardwere: $hardwere, firmwawe: $firmwawe, batery: $batery, localip: $localip, checkHours: $checkHours, checkPeriodDipslay: $checkPeriodDipslay, lastConnection: $lastConnection, lastConnectionWarning: $lastConnectionWarning, licChennels: $licChennels, requests: $requests, rssi: $rssi, log: $log, scan: $scan, vol: $vol, send: $send, readoutDate: $readoutDate, requestDate: $requestDate, capState: $capState, powerSupply: $powerSupply, emptyInputs: $emptyInputs, nbiot: $nbiot, meterList: $meterList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorDtoImpl &&
            (identical(other.sn, sn) || other.sn == sn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.hardwere, hardwere) ||
                other.hardwere == hardwere) &&
            (identical(other.firmwawe, firmwawe) ||
                other.firmwawe == firmwawe) &&
            (identical(other.batery, batery) || other.batery == batery) &&
            (identical(other.localip, localip) || other.localip == localip) &&
            (identical(other.checkHours, checkHours) ||
                other.checkHours == checkHours) &&
            (identical(other.checkPeriodDipslay, checkPeriodDipslay) ||
                other.checkPeriodDipslay == checkPeriodDipslay) &&
            (identical(other.lastConnection, lastConnection) ||
                other.lastConnection == lastConnection) &&
            (identical(other.lastConnectionWarning, lastConnectionWarning) ||
                other.lastConnectionWarning == lastConnectionWarning) &&
            (identical(other.licChennels, licChennels) ||
                other.licChennels == licChennels) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.log, log) || other.log == log) &&
            (identical(other.scan, scan) || other.scan == scan) &&
            (identical(other.vol, vol) || other.vol == vol) &&
            (identical(other.send, send) || other.send == send) &&
            (identical(other.readoutDate, readoutDate) ||
                other.readoutDate == readoutDate) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.capState, capState) ||
                other.capState == capState) &&
            (identical(other.powerSupply, powerSupply) ||
                other.powerSupply == powerSupply) &&
            (identical(other.emptyInputs, emptyInputs) ||
                other.emptyInputs == emptyInputs) &&
            (identical(other.nbiot, nbiot) || other.nbiot == nbiot) &&
            const DeepCollectionEquality()
                .equals(other._meterList, _meterList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        sn,
        name,
        model,
        active,
        ssid,
        hardwere,
        firmwawe,
        batery,
        localip,
        checkHours,
        checkPeriodDipslay,
        lastConnection,
        lastConnectionWarning,
        licChennels,
        requests,
        rssi,
        log,
        scan,
        vol,
        send,
        readoutDate,
        requestDate,
        capState,
        powerSupply,
        emptyInputs,
        nbiot,
        const DeepCollectionEquality().hash(_meterList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorDtoImplCopyWith<_$SensorDtoImpl> get copyWith =>
      __$$SensorDtoImplCopyWithImpl<_$SensorDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorDtoImplToJson(
      this,
    );
  }
}

abstract class _SensorDto implements SensorDto {
  const factory _SensorDto(
          {required final String sn,
          required final String name,
          required final String model,
          required final bool active,
          required final String ssid,
          required final String? hardwere,
          required final String? firmwawe,
          required final int batery,
          required final String localip,
          required final int checkHours,
          required final String? checkPeriodDipslay,
          required final DateTime lastConnection,
          required final String? lastConnectionWarning,
          required final int? licChennels,
          required final int requests,
          required final String rssi,
          required final double log,
          required final int scan,
          required final int vol,
          required final int send,
          required final DateTime? readoutDate,
          required final DateTime? requestDate,
          required final bool capState,
          required final bool powerSupply,
          required final bool emptyInputs,
          required final String nbiot,
          @JsonKey(name: "meters") required final List<MeterDto> meterList}) =
      _$SensorDtoImpl;

  factory _SensorDto.fromJson(Map<String, dynamic> json) =
      _$SensorDtoImpl.fromJson;

  @override
  String get sn;
  @override
  String get name;
  @override
  String get model;
  @override
  bool get active;
  @override
  String get ssid;
  @override
  String? get hardwere;
  @override
  String? get firmwawe;
  @override
  int get batery;
  @override
  String get localip;
  @override
  int get checkHours;
  @override
  String? get checkPeriodDipslay;
  @override
  DateTime get lastConnection;
  @override
  String? get lastConnectionWarning;
  @override
  int? get licChennels;
  @override
  int get requests;
  @override
  String get rssi;
  @override
  double get log;
  @override
  int get scan;
  @override
  int get vol;
  @override
  int get send;
  @override
  DateTime? get readoutDate;
  @override
  DateTime? get requestDate;
  @override
  bool get capState;
  @override
  bool get powerSupply;
  @override
  bool get emptyInputs;
  @override
  String get nbiot;
  @override
  @JsonKey(name: "meters")
  List<MeterDto> get meterList;
  @override
  @JsonKey(ignore: true)
  _$$SensorDtoImplCopyWith<_$SensorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
