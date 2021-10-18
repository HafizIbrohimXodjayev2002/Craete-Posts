import 'package:createposts/components/custom_surfix_icon.dart';
import 'package:createposts/components/default_button.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  try {
                    controller.signUp();
                  } catch (e) {
                    print("Xato bor: $e");
                  }
                }
              },
            ),
          ],
        ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      controller: controller.passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter password!";
        } else if (value.length < 6) {
          return "Please enter more than 6 character!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(17)),
          child: Icon(
            Icons.visibility_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      controller: controller.nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter something!";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: controller.emailController,
      validator: (value) {
        if (!emailValidatorRegExp.hasMatch(value!)) {
          return "Please enter correct email";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
