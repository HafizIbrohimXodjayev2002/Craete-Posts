import 'package:createposts/components/default_button.dart';
import 'package:createposts/constants.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/screens/home/home_screen.dart';
import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM yyyy').format(now);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create Posts\n with us",
                  textAlign: TextAlign.center,
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenHeight(80)),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: title,
                  decoration: InputDecoration(
                      hintText: "Enter title...",
                      hintStyle:
                          TextStyle(fontSize: getProportionateScreenWidth(16))),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                TextFormField(
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: "Enter description...",
                      hintStyle:
                          TextStyle(fontSize: getProportionateScreenWidth(16))),
                ),
                SizedBox(height: getProportionateScreenHeight(180)),
                DefaultButton(
                  text: "Add Post",
                  press: () {
                    controller.getFirestoreData(description: description.text, title: title.text, data: formattedDate);
                    Get.offAll(HomeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
