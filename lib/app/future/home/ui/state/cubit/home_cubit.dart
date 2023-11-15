import 'package:bloc/bloc.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/data/dto/object/object_list_dto.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/sensor_dto.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/sensor_list_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/common/fauler.dart';

import '../../../../../data/dto/object/object_dto.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.helper,
    this.remoteDataSource,
    this.localDataSource,
  ) : super(HomeInitial());

  final HiveHelper helper;
  final RemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  List<ObjectDTO> listObeject = [];
  List<SensorDTO> listSensor = [];
  String _objectId = '';

  void init() async {
    emit(HomeLoad());
    final resultData = await Future.wait([
      helper.getUserObject(),
      helper.getUserObjectMeters(),
    ]);
    final getUserObject = resultData[0];
    final getUserObjectMeters = resultData[1];
    listObeject = (getUserObject as ObjectListDTO).objects;
    listSensor = (getUserObjectMeters as SensorListDTO).sensorList;
    _objectId = listObeject.first.id.toString();
    emit(HomeSeccues());
  }

  void changeObejt(String objectId) async {
    emit(HomeLoad());
    _objectId = objectId;
    final String sid = localDataSource.getSid();
    try {
      final result = await remoteDataSource.objectMetersDTO(sid, objectId);
      listSensor = result.data.sensorList;
      emit(HomeSeccues());
    } on AuthorizationExeption catch (e) {
    } on ServerExeption catch (e) {}
  }

  Future<void> onRefresh() async {
    final String sid = localDataSource.getSid();
    try {
      final result = await remoteDataSource.objectMetersDTO(sid, _objectId);
      listSensor = result.data.sensorList;
      emit(HomeSeccues());
    } on AuthorizationExeption catch (e) {
    } on ServerExeption catch (e) {}
  }
}
