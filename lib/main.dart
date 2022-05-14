import 'package:alemeno/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'dependencies/controller_bindings.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'alemeno',
      channelName: 'All in app Notification',
      channelDescription: 'Notifications for alemeno app',
    )
  ]);
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      theme: ThemeData(fontFamily: "andika"),
      home: const HomeScreen(),
    );
  }
}
