import 'package:carvendor/splash_screen.dart';
import 'package:carvendor/utilities/notification_Utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase init failed: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(message.data);
        NotificationUtils.showNotification(context, message);
      });
    } catch (e) {
      debugPrint('FCM listener failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BusHub Partner',
      builder: EasyLoading.init(),
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme() {
    var baseTheme = ThemeData.light();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.deepOrangeAccent,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
      ),
      textTheme: baseTheme.textTheme.apply(fontFamily: 'Inter'),
    );
  }
}
