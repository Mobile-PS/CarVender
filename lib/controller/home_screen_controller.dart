import 'dart:async';
import 'package:carvendor/models/CommonModel.dart';
import 'package:carvendor/models/OrderModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../api/apis.dart';
import '../preferences/pref_repository.dart';
import '../utilities/common.dart';
class HomeScreenController extends GetxController {
  OrderModel? pendingOrderResponse;
  OrderModel? processOrderResponse;
  OrderModel? completeOrderResponse;
  final _prefRepo = PrefRepository();
  bool loading = false;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<OrderModel?> getData() async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().PendingData(
        profileResponse!.customer!.id.toString());
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      //showSnackbar('S');
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return pendingOrderResponse;
  }

  Future<OrderModel?> getDataInProcess() async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().ProcessData(
        profileResponse!.customer!.id.toString());
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      processOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      //showSnackbar('S');
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return pendingOrderResponse;
  }

  Future<OrderModel?> getDataCompleted() async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().CompletedData(
        profileResponse!.customer!.id.toString());
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      completeOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      //showSnackbar('S');
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return completeOrderResponse;
  }

  Future<CommonModel?> acceptBookingRequest(String bookingid) async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().AcceptBookingRequest(
        profileResponse!.customer!.id.toString(), bookingid);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      // pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      showSnackbar('Booking request accepted');
      getData();
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return response;
  }

  Future<CommonModel?> StartTrip(String bookingid) async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().StartTripRequest(
        profileResponse!.customer!.id.toString(), bookingid);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      // pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      showSnackbar('Trip Started');
      getDataInProcess();
    }
    else {
      if (response != null)
        showSnackbar('Fail To Start');
    }
    update();
    return response;
  }

  Future<CommonModel?> StopTrip(String bookingid, String tollprice,
      String extrakm, String totalamount) async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().StopTripRequest(
        profileResponse!.customer!.id.toString(), bookingid,
        tollprice, extrakm, totalamount);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      // pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      showSnackbar('Trip Ended');
      getDataInProcess();
    }
    else {
      if (response != null)
        showSnackbar('Fail To Stop');
    }
    update();
    return response;
  }

  Future<CommonModel?> rejectBookingRequest(String bookingid) async {
    final profileResponse = await _prefRepo.getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().RejectBookingRequest(
        profileResponse!.customer!.id.toString(), bookingid);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      // pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      showSnackbar('Booking request rejected');
      getData();
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return response;
  }

  Future<CommonModel?> cancelBookingRequest(String bookingid) async {
    final profileResponse = await _prefRepo
        .getLoginUserData();
    EasyLoading.show(status: 'loading...');
    final response = await Apis().CancelBookingRequest(
        profileResponse!.customer!.id.toString(), bookingid);
    printLog(response);
    EasyLoading.dismiss();
    if (response != null) {
      // pendingOrderResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);
      showSnackbar('Booking request canceled');
      getDataInProcess();
    }
    else {
      if (response != null)
        showSnackbar('Fail');
    }
    update();
    return response;
  }
}