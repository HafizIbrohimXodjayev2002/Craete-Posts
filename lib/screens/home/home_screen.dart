import 'package:createposts/components/coustom_bottom_nav_bar.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/enums.dart';
import 'package:createposts/screens/home/components/body.dart';
import 'package:createposts/screens/home/components/floating_action_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends GetWidget<AuthController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      body: Body(),
      floatingActionButton: FloatingActionAvatarGlow(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

