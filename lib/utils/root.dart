import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/screens/home/home_screen.dart';
import 'package:createposts/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? HomeScreen() : SignInScreen();
    });
  }
}
