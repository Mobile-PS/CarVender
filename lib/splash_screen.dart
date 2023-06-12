

import 'package:carvendor/constants.dart';
import 'package:carvendor/home_screen.dart';
import 'package:carvendor/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}


class _SplashScreen extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {

      navigate();

    });
  }

  navigate() async {

      Get.to(SigninScreen());
  }

      @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
          child:
          SizedBox(
            height: 400.0,
            width: 300.0,
            child: Image.asset('assets/logo.png',fit: BoxFit.cover,),
          ),
        ),


    );

  }

}
