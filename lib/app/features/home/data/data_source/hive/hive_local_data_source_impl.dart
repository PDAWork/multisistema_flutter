import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/model/object_dto.dart';
import 'package:path_provider/path_provider.dart';

class HiveLocalDataSourceImpl implements HiveLocalDataSource {
  final _kObjectBox = 'object_box';

  @override
  Future<bool> initDb() async {
    try {
      if (!kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      Hive.registerAdapter(ObjectHiveAdapter());
      await Hive.openBox<ObjectDto>(_kObjectBox);
      return true;
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<Unit> setObject(List<ObjectDto> model) async {
    final obejctBox = Hive.box<ObjectDto>(_kObjectBox);
    // await tasksBox.clear();
    await obejctBox.addAll(model);
    return Future.value(unit);
  }

  @override
  Future<List<ObjectDto>> getObject() async {
    final objectBox = Hive.box<ObjectDto>(_kObjectBox);
    return objectBox.values
        .map<ObjectDto>(
          (e) => ObjectDto(
            id: e.id,
            house: e.house,
            label: e.label,
            accountId: e.accountId,
            personalAccount: e.personalAccount,
            connectDate: e.connectDate,
            enable: e.enable,
            balanceObject: e.balanceObject,
            accesLevel: e.accesLevel,
            objectCompanyName: e.objectCompanyName,
            objectCompanyUrl: e.objectCompanyUrl,
          ),
        )
        .toList();
  }
}
