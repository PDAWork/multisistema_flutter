import 'package:bloc/bloc.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/data/dto/object/object_dto.dart';
import 'package:multisitema_flutter/app/data/dto/object/object_list_dto.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/sensor_dto.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/sensor_list_dto.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.helper) : super(HomeInitial());

  final HiveHelper helper;

  List<ObjectDTO> listObeject = [];
  List<SensorDTO> listSensor = [];

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
    emit(HomeSeccues());
  }
}
