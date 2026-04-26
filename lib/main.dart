
import 'package:firebase_connection_in_counterapp/app.dart';
import 'package:firebase_connection_in_counterapp/fcm_message%20_setvice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FcmMessageService().initialize();
  
  runApp(const MyApp());
}