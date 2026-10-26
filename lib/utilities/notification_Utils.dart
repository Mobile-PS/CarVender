import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fcm;
import 'package:http/http.dart' as http;

class NotificationUtils {
  static String formatDate(String dateStr) {
    final DateTime date = DateFormat('dd/MM/yyyy').parse(dateStr);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  static String formatDateValue(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateTime);
    print(formatted);
    return formatted;
  }

  static Future<void> showNotification(
      BuildContext? context, fcm.RemoteMessage event) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {
        if (context != null) {
          onDidReceiveLocalNotification(
              context, id, title ?? '', body ?? '', payload ?? '');
        }
      },
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {},
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'LightGallery',
      'LightGallery',
      channelDescription: 'LightGallery',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      channelShowBadge: true,
      playSound: true,
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final title = event.notification?.title ??
        event.data['title']?.toString() ??
        'Notification';
    final body = event.notification?.body ??
        event.data['body']?.toString() ??
        '';

    await flutterLocalNotificationsPlugin.show(
      UniqueKey().hashCode,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

  static void onDidReceiveLocalNotification(BuildContext context, int id,
      String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {},
          )
        ],
      ),
    );
  }

  static Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}
