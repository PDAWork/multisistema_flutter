import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/my_app.dart';
import 'package:multisitema_flutter/common/locator_service.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();
  runApp(const MyApp());
}
