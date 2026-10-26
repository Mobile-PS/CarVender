import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../api/apis.dart';
import '../home_screen.dart';
import '../models/LoginModel.dart';
import '../preferences/pref_repository.dart';
import '../utilities/common.dart';
class LoginScreenController extends GetxController {
  LoginModel? loginScreenResponse;
  bool loading = false;
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final pref = PrefRepository();
  bool check = false;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  void toggleCheck() {
    if (check) {
      check = false;
    } else {
      check = true;
    }
    update();
  }

  Future<LoginModel?> VerifyLogin() async {
    String ? mytoken;
    EasyLoading.show(status: 'loading...');
    //toggleLoading();
    try {
      mytoken = await FirebaseMessaging.instance.getToken();
      debugPrint("device Token :$mytoken");
    } catch (e) {
      debugPrint("FCM token failed: $e");
    }
    mytoken ??= '';
    final response = await Apis().Login(
        emailtxtController.text, passwordController.text, mytoken!);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      loginScreenResponse = response;
      //  pref.clearPreferences();
      if (loginScreenResponse!.status!) {
        // Get.off(BookingForm(car1: car1,type: type,waypoints: waypoints,));
        pref.saveLoginData(loginScreenResponse!);
        Get.offAll(HomeScreen());
        showSnackbar('Login Success');
      }
      else {
        showSnackbar('Login Fail');
      }
    }
    else {
      if (response != null)
        showSnackbar('Internal server error');
    }
    // toggleLoading();
    update();
    return loginScreenResponse;
  }
}