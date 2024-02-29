import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class MeuFirebaseMessagingService{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void subscribeToTopic(String topic) {
    _firebaseMessaging.subscribeToTopic(topic).then((value) {
      print("MeuFirebaseMessagingService.subscribeToTopic $topic");
    }, onError: (e) {
      print(e.toString());
    });
  }

  void unsubscribeFromTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic).then((value) {
      print("MeuFirebaseMessagingService.unsubscribeFromTopic $topic");
    }, onError: (e) {
      print(e.toString());
    });
  }

  void requestNotificationPermission() async {
    if (!Platform.isIOS) {
      return;
    }
    bool result = (await _firebaseMessaging.requestPermission(
        alert: true,
        sound: true,
        badge: true,
        )) as bool;
//    print('result:$result');
//    _firebaseMessaging.onIosSettingsRegistered
//        .listen((IosNotificationSettings settings) {
//      print("Settings registered: $settings");
//    });
  }
}