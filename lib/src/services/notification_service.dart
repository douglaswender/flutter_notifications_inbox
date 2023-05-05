import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> initialize() async {
    await messaging.requestPermission();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('drawable/ic_launcher_round');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    // FirebaseFirestore.instance.collection('deviceTokens').add({
    //   "token": await FirebaseMessaging.instance.getToken(),
    // });

    listen();

    FirebaseMessaging.onBackgroundMessage((message) async {
      if (message.notification != null) {
        displayNotification(
            title: message.notification?.title ?? '',
            body: message.notification?.title ?? '');
      }
    });
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  static void displayNotification(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: 'item x');
  }

  static void listen() async {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.data);
      if (message.notification != null) {
        displayNotification(
            title: message.notification?.title ?? '',
            body: message.notification?.body ?? '');
      }
    });
  }
}
