import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:multisitema_flutter/utils/locator_service.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();

  
}
