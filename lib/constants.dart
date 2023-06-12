import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF7033FF);
Color kPrimaryColorShadow = Color(0xFFF1EBFF);

const kSmallDescStyle = TextStyle(fontSize: 12, color: Colors.deepOrangeAccent);

const kMediumDescStyle = TextStyle(fontSize: 14, color: Colors.deepOrangeAccent);

const kLargeDescStyle = TextStyle(fontSize: 17, color: Colors.deepOrangeAccent,  	fontWeight: FontWeight.bold);


final kShape =
RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

final privacy = "By proceeding I agree to eConstro";
final privacy1 = "Terms of Services";
final privacy2 = "Privacy Policy";

final customBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.deepOrangeAccent,
    width: 1.0,
  ),
);


final customfocusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.deepOrangeAccent,
    width: 1.0,
  ),
);

final customerrorBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.deepOrangeAccent,
    width: 1.0,
  ),
);