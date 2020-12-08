import 'package:FirestoreCRUDApp/widgets/bottom_sheet_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationManager {

  BuildContext context;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  void initFirebaseMessaging(){
    firebaseMessaging.configure(

      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Map mapNotification = message['notification'];
        String title = mapNotification['title'];
        String body = mapNotification['body'];
        BottomSheetWidget().bottomSheet(context, title, body);
      },

      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Map mapNotification = message['notification'];
        String title = mapNotification['title'];
        String body = mapNotification['body'];
        BottomSheetWidget().bottomSheet(context, title, body);
      },

      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Map mapNotification = message['notification'];
        String title = mapNotification['title'];
        String body = mapNotification['body'];
        BottomSheetWidget().bottomSheet(context, title, body);
      },

    );

    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true));
      firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      }
    );

    // Get token
    firebaseMessaging.getToken().then((String token){
      print("Token: $token");
    });
    
  }

}