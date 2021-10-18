import 'package:createposts/constants.dart';
import 'package:createposts/size_config.dart';
import 'package:createposts/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedSpalsh extends StatelessWidget {
  const AnimatedSpalsh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      duration: 1500,
      splash: Center(
        child: Text(
          "Your Logo Will Be There!",
          textAlign: TextAlign.center,
          style: headingStyle,
        ),
      ),
      nextScreen: Root(),
      pageTransitionType: PageTransitionType.leftToRight,
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white,
      splashIconSize: 500,
      animationDuration: animationDuration,
    );
  }
}
