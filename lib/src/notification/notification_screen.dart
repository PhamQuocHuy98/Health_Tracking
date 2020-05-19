import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  showNotification() async {
    int minutesIncrement = 30;

    for (int i = 0; i < 10; i++) {
      var scheduledNotificationDateTime =
          DateTime.now().add(Duration(seconds: 5));
      print(scheduledNotificationDateTime);
      var vibrationPattern = Int64List(4);
      vibrationPattern[0] = 0;
      vibrationPattern[1] = 1000;
      vibrationPattern[2] = 5000;
      vibrationPattern[3] = 2000;
      var android = AndroidNotificationDetails(
        'channel id',
        'channel NAME',
        'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        vibrationPattern: vibrationPattern,
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500,
      );
      var iOS = new IOSNotificationDetails();
      var platform = new NotificationDetails(android, iOS);
      await flutterLocalNotificationsPlugin.schedule(
        0,
        'Demo Pushnotification',
        'Đã đến giờ uống nước',
        scheduledNotificationDateTime,
        platform,
        payload: 'Phạm Quốc Huy',
        androidAllowWhileIdle: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Aodiksd'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () async {
            await showNotification();
          },
          child: new Text(
            'Demo',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
