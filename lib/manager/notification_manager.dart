import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@singleton
class NotificationManager {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  void init() async {
    tz.initializeTimeZones();

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('launch_background');
    final IOSInitializationSettings initializationSettingsIOS =IOSInitializationSettings(onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: _selectNotification);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'RepeatingElonMuskId', 'ultimateSpaceXAppNotificationRepeatingChannel',
        channelDescription: 'Notification channel for Ultimate SpaceX App every day notifications');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.periodicallyShow(1, 'Elon want\'s you !',
        'Check it out !', RepeatInterval.daily, platformChannelSpecifics,
        androidAllowWhileIdle: true);

  }

  void _selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {

  }

  void send([String title = "", String body = "", String payload = "", int id = 0]) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('ElonMuskId', 'ultimateSpaceXAppNotificationChannel',
        channelDescription: 'Notification channel for Ultimate SpaceX App',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
        id, title, body, platformChannelSpecifics,
        payload: payload);
  }

}