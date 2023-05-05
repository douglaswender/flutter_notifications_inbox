import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_notifications_inbox/src/services/notification_service.dart';
import './src/app_module.dart';
import './src/app_widget.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService.initialize();

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
