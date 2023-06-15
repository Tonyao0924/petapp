import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:petapp/manager/service/navigationService.dart';

/*
  onBackgroundMessageHandler will be perform when app is closed
*/
Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

/*
  onMessageOpenedApp will be perform when app is minimization and press FCM message
*/
void onMessageOpenedApp(RemoteMessage message) {
  debugPrint('Got a message whilst in the onMessageOpenedApp!');
  debugPrint('Message data: ${message.data}');

  if (message.notification != null) {
    debugPrint('Message also contained a notification: ${message.notification}');
  }
  NavigationService.navigatorKey.currentState
      ?.pushNamed('/symptomCheck', arguments: message.data);
}

/*
  onMessageHandler will be perform when app is opening and receive FCM message
*/
void onMessageHandler(RemoteMessage message) {
  debugPrint('Got a message whilst in the foreground!');
  debugPrint('Message data: ${message.data}');

  if (message.notification != null) {
    debugPrint('Message also contained a notification: ${message.notification}');
  }
  if (NavigationService.navigatorKey.currentContext != null) {
    showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text("LBBB發生"),
          content: Text( "機率: "+(json.decode(message.data['lbbbProb']) *100) .toString()+"%"),
          actions: [
            TextButton(
                child: const Text("填寫症狀"),
                onPressed: () {
                  NavigationService.navigatorKey.currentState
                      ?.pushNamed('/symptomCheck', arguments: message.data);
                }),
            TextButton(
              child: const Text("取消"),
              onPressed: () {},
            )
          ],
        ));
  }
}

Future<void> FCMinit() async {
  String? fcmToken;
  if (kIsWeb) {
    fcmToken = await FirebaseMessaging.instance.getToken(
        vapidKey:
        "BN-F0_TfkydWHZVGxatOu3Ru-xuh1gxwf44ES1AB02uYxU9R8Ub0eHZmBkyFIBjbxSOMynj-roQ3TR9hEj60A6g");
  } else {
    fcmToken = await FirebaseMessaging.instance.getToken();
  }
  debugPrint('fcmToken:$fcmToken');

  // FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);
  FirebaseMessaging.onMessage.listen(onMessageHandler);
  FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
}