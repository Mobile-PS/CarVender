import 'package:carvendor/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

ThemeData lightTheme() {
  var baseTheme = ThemeData.light();
  baseTheme.textTheme.apply(fontFamily: 'Inter');
  baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.deepOrangeAccent,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
      ));

  return baseTheme;
}