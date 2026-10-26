import 'package:carvendor/WebViewScreen.dart';
import 'package:carvendor/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          privacy,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                Get.to(WebViewScreen(url: 'https://bushub.co.in/vendor'));
              },
              child: Text(
                privacy1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'and',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () async {
                Get.to(WebViewScreen(url: 'https://bushub.co.in/vendor'));
              },
              child: Text(
                privacy2,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }}