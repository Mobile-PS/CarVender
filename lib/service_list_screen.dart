import 'package:carvendor/freelancer_card.dart';
import 'package:carvendor/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_screen_controller.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({Key? key}) : super(key: key);

  @override
  _ServiceListScreen createState() => _ServiceListScreen();
}

class _ServiceListScreen extends State<ServiceListScreen> {
  final loginCtrl = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (_) {
      final dataList = loginCtrl.pendingOrderResponse?.data;
      if (dataList == null || dataList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 60, color: Colors.grey),
              SizedBox(height: 10),
              Text(
                "Data not found",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
      }
      return Container(
        color: Colors.white,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: loginCtrl.pendingOrderResponse?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                child: FreelancerCard(
                  color: Colors.amber[300],
                  name: 'Jane Doe',
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  description: 'Investment Consultant',
                  rating: 5.0,
                  comments: 15,
                  orderData: loginCtrl.pendingOrderResponse?.data?[index],
                  onpress1: () {
                    loginCtrl.acceptBookingRequest(loginCtrl
                        .pendingOrderResponse!.data![index].id
                        .toString());
                  },
                  onRejectpress1: () {
                    showSnackbar(
                        'Only admin or customer can cancel this trip.');
                    // loginCtrl.rejectBookingRequest(loginCtrl.pendingOrderResponse!.data![index].id.toString());
                  },
                ),
              );
            }),
      );
    });
  }
}
