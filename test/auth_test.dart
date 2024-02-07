import 'package:flutter_test/flutter_test.dart';
import 'package:multisitema_flutter/di/locator_service.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();
}
