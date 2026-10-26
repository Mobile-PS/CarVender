import 'package:carvendor/controller/home_screen_controller.dart';
import 'package:carvendor/profile.dart';
import 'package:carvendor/service_list_screen.dart';
import 'package:carvendor/service_list_screen1.dart';
import 'package:carvendor/service_list_screen2.dart';
import 'package:carvendor/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // final userPreference = Get.put(UserPreferenceScreenController());
  late TabController _controller;
  IconData icon = Icons.arrow_forward_ios_rounded;
  final loginCtrl = Get.put(HomeScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      printLog("Selected Index: " + _controller.index.toString());
      if (_controller.index == 0) {
        loginCtrl.getData();
      }
      if (_controller.index == 1) {
        loginCtrl.getDataInProcess();
      }
      if (_controller.index == 2) {
        loginCtrl.getDataCompleted();
      }
    });
    loginCtrl.getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: SizedBox.shrink(),
            /*IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),*/
            actions: [
              IconButton(
                icon: Icon(
                  Icons.perm_contact_cal_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.to(Profile());
                },
              ),
            ],
            title: Image.asset(
              'assets/logo.png',
              height: 150,
              width: 130,
            ),
            bottom: TabBar(
              labelColor: Colors.grey,
              indicatorColor: Colors.deepOrangeAccent,
              isScrollable: true,
              controller: _controller,
              tabs: [
                Tab(
                  child: Text(
                    "Request",
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
                Tab(
                  child: Text(
                    'Ongoing',
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed',
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(children: [
            TabBarView(
              controller: _controller,
              children: const [
                ServiceListScreen(),
                ServiceListScreen1(),
                ServiceListScreen2(),
                // PersonalFormWidget(),
                // ProfessionalFormWidget(),
                // PersonalUplodFormWidget(),
              ],
            ),
          ]),
        ));
  }
}
