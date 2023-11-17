import 'package:bloc/bloc.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/sensor_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

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

  DateTime date = DateTime.now();
  String selectDateTime = '';

  void init(String idObject) async {
    emit(HomeLoad());
    selectDateTime = DateFormat('dd.MM.yyyy').format(date);
    final getUserObjectMeters =
        await helper.getUserObjectMeters('$idObject $selectDateTime');
    emit(HomeSeccues(listSensor: getUserObjectMeters.sensorList));
  }

  void onDropChangedObject(String idObject, {DateTime? dateTime}) async {
    dateTime = dateTime ?? date;
    selectDateTime = DateFormat('dd.MM.yyyy').format(date);
    emit(HomeLoad());
    var getUserObjectMeters =
        (await helper.getUserObjectMeters('$idObject $selectDateTime'))
            .sensorList;
    if (getUserObjectMeters.isEmpty) {
      final String sid = localDataSource.getSid();
      String dateRequest = date.toIso8601String().substring(
            0,
            date.toIso8601String().indexOf('.'),
          );
      final result =
          await remoteDataSource.objectMetersDTO(sid, idObject, dateRequest);
          if(result.status == "bad"){
            emit(ExeptionHome());
          }
      getUserObjectMeters = result.data.sensorList;
      helper.setObjectMeters(result.data, idObject, date);
    }
    emit(HomeSeccues(listSensor: getUserObjectMeters));
  }

  Future<void> onRefresh(String objectId) async {
    final String sid = localDataSource.getSid();
    try {
      final String dateParam = date.toIso8601String().substring(
            0,
            date.toIso8601String().indexOf('.'),
          );
      final result =
          await remoteDataSource.objectMetersDTO(sid, objectId, dateParam);
      if (result.status == 'bad') {
        return;
      }
      helper.updateObjectMeters(result.data, objectId, selectDateTime);
      emit(HomeSeccues(listSensor: result.data.sensorList));
    } on AuthorizationExeption catch (e) {
    } on ServerExeption catch (e) {}
  }
}
