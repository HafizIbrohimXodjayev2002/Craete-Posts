import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF008080);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);
const animationDuration = Duration(milliseconds: 600);


const double kCurveHeight = 35.0;


final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");



OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

List<String> images = [
    "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
     "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
     "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
     "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
     "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
     "assets/images/nature.jpg",
    "assets/images/nature2.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature4.jpg",
    "assets/images/nature5.jpg",
    "assets/images/nature6.jpg",
    
  ];

