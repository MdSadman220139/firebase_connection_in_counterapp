import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FcmMessageService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    // foreground----->running app
    FirebaseMessaging.onMessage.listen(_onForgroundNotificationRecieved);
    // background----->app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen(
      _onForgroundNotificationRecieved,
    );
    // terminated----->app is completely closed
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotificationMessage);
  }

  void _onForgroundNotificationRecieved(RemoteMessage message) {
    print("message");
  }

  void _onBackgroundNotificationRecieved(RemoteMessage message) {
    print("message");
  }
}

Future<void> onBackgroundNotificationMessage(RemoteMessage message) async {
  // Handle background notification
  print("message");
}
