import 'package:createposts/components/no_account_text.dart';
import 'package:createposts/components/socal_card.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'sign_form.dart';

class Body extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(7),
                ),
                Text(
                  "with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        controller.googleSignIn();
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(60)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
