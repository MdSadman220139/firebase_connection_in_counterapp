import 'package:firebase_connection_in_counterapp/app.dart';
import 'package:firebase_connection_in_counterapp/fcm_message_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FcmMessageService().initialize();
  FcmMessageService().onTokenRefreashed();
  String? token = await FcmMessageService().getFcmToken();
  print('FCM Token: $token');

  runApp(const MyApp());
}
