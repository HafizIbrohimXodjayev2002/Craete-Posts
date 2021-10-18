import 'package:avatar_glow/avatar_glow.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/screens/create_posts/create_posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionAvatarGlow extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor: Colors.blue.shade800,
      endRadius: 50.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: Material(
        elevation: 10.0,
        shape: CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Colors.blue.shade800,
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(CreatePostsScreen());
          },
        ),
      ),
    );
  }
}