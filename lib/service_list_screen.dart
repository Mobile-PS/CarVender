import 'package:carvendor/freelancer_card.dart';
import 'package:flutter/material.dart';




class ServiceListScreen extends StatefulWidget {

  const ServiceListScreen({Key? key})
      : super(key: key);

  @override
  _ServiceListScreen createState() => _ServiceListScreen();
}

class _ServiceListScreen extends State<ServiceListScreen> {
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
                          child: FreelancerCard(
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


