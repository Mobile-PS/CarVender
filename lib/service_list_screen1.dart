import 'package:carvendor/freelancer_card.dart';
import 'package:carvendor/freelancer_card1.dart';
import 'package:carvendor/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_screen_controller.dart';

class ServiceListScreen1 extends StatefulWidget {
  const ServiceListScreen1({Key? key})
      : super(key: key);

  @override
  _ServiceListScreen1 createState() => _ServiceListScreen1();
}

class _ServiceListScreen1 extends State<ServiceListScreen1> {
  final loginCtrl = Get.put(HomeScreenController());

  void showPriceDialog(BuildContext context, String perkm, String totalpris,
      String id) {
    final _formKey = GlobalKey<FormState>();
    final tollController = TextEditingController();
    final kmController = TextEditingController();
    final totalController = TextEditingController();
    totalController.text = totalpris;
    tollController.addListener(() {
      print("Toll Price: ${tollController.text}");
      // You can also trigger total calculation or state update here
      if (tollController.text.isNotEmpty) {
        if (kmController.text.isEmpty && tollController.text.isNotEmpty) {
          var total = int.parse(tollController.text) +
              double.parse(totalpris).toInt();
          totalController.text = total.toString();
        }
        else {
          if (tollController.text.isNotEmpty && kmController.text.isNotEmpty) {
            var Extrakm = int.parse(kmController.text) * int.parse(perkm);
            var total = int.parse(tollController.text) + Extrakm +
                double.parse(totalpris).toInt();
            totalController.text = total.toString();
          }
        }
      }
      else {
        if (kmController.text.isNotEmpty) {
          var Extrakm = int.parse(kmController.text) * int.parse(perkm);
          var total = Extrakm + double.parse(totalpris).toInt();
          totalController.text = total.toString();
        }
        else {
          totalController.text = totalpris;
        }
      }
    });
    kmController.addListener(() {
      print("Extra KM: ${kmController.text}");
      if (kmController.text.isNotEmpty) {
        if (tollController.text.isEmpty && kmController.text.isNotEmpty) {
          var Extrakm = int.parse(kmController.text) *
              (double.tryParse(perkm ?? "0") ?? 0).toInt();
          var total = Extrakm + double.parse(totalpris).toInt();
          totalController.text = total.toString();
        }
        else {
          if (tollController.text.isNotEmpty && kmController.text.isNotEmpty) {
            var Extrakm = int.parse(kmController.text) *
                (double.tryParse(perkm ?? "0") ?? 0).toInt();
            var total = int.parse(tollController.text) + Extrakm +
                double.parse(totalpris).toInt();
            totalController.text = total.toString();
          }
        }
      }
      else {
        if (tollController.text.isNotEmpty) {
          var total = int.parse(tollController.text) +
              double.parse(totalpris).toInt();
          totalController.text = total.toString();
        }
        else {
          totalController.text = totalpris;
        }
      }
    });
    totalController.addListener(() {
      print("Total Amount: ${totalController.text}");
    });
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            title: Center(child: Text("Enter Details")),
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildValidatedField("Toll + Parking", tollController),
                    SizedBox(height: 10),
                    buildValidatedField("Extra Km", kmController),
                    SizedBox(height: 10),
                    buildValidatedField("Total Fair", totalController),
                  ],
                ),
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actionsPadding: EdgeInsets.symmetric(horizontal: 12),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Toll: ${tollController.text}, KM: ${kmController
                        .text}, Total: ${totalController.text}");
                    Navigator.pop(context);
                    var Extrakm = int.parse(kmController.text) *
                        int.parse(perkm);
                    loginCtrl.StopTrip(
                        id, tollController.text, Extrakm.toString(),
                        totalpris.toString());
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
    );
  }
    Widget buildValidatedField(String label, TextEditingController controller) {
      return TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value
              .trim()
              .isEmpty) {
            return "$label is required";
          } else if (double.tryParse(value.trim()) == null) {
            return "Enter a valid number";
          }
          return null;
        },
      );
    }

      @override
      Widget build(BuildContext context) {
        return GetBuilder<HomeScreenController>(
          builder: (_) {
            final dataList = loginCtrl.processOrderResponse?.data;
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
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                    child: FreelancerCard1(
                      color: Colors.amber[300],
                      name: 'Jane Doe',
                      image: AssetImage('assets/logo.png'),
                      description: 'Investment Consultant',
                      rating: 5.0,
                      comments: 15,
                      orderData: dataList[index],
                      onpress1: () {
                        final order = dataList[index];
                        if (order.isTripStarted.toString() == 'N') {
                          loginCtrl.StartTrip(order.id.toString());
                        } else {
                          showPriceDialog(
                            context,
                            order.perKMPrice.toString(),
                            order.totalPrice.toString(),
                            order.id.toString(),
                          );
                        }
                      },
                      onRejectpress1: () {
                        showSnackbar(
                            'Only admin or customer can cancel this trip.');
                        //  loginCtrl.cancelBookingRequest(dataList[index].id.toString());
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      }
    }