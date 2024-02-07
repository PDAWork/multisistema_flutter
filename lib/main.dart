import 'package:flutter/material.dart';
import 'package:multisitema_flutter/features/my_app.dart';
import 'package:multisitema_flutter/di/locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();
  runApp(const MyApp());
}
