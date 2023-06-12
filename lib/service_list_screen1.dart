import 'package:carvendor/freelancer_card.dart';
import 'package:carvendor/freelancer_card1.dart';
import 'package:flutter/material.dart';




class ServiceListScreen1 extends StatefulWidget {

  const ServiceListScreen1({Key? key})
      : super(key: key);

  @override
  _ServiceListScreen1 createState() => _ServiceListScreen1();
}

class _ServiceListScreen1 extends State<ServiceListScreen1> {
  @override
  Widget build(BuildContext context) {
            return  Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 4),
                          child: FreelancerCard1(
                            color: Colors.amber[300],
                            name: 'Jane Doe',
                            image: AssetImage(
                              'assets/logo.png',
                            ),
                            description: 'Investment Consultant',
                            rating: 5.0,
                            comments: 15,
                          ),
                        );
                      }),
                );
          }
        }


