import 'package:firebase_messaging/firebase_messaging.dart';

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
    print(message);
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
  }

 

  static Future<void> onBackgroundNotificationMessage(
    RemoteMessage message,
  ) async {
    // Handle background notification
    print('Background message received: $message');
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
  }


   Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }
  void onTokenRefreashed() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      //api send refreashed token to server
    });
  }
}
