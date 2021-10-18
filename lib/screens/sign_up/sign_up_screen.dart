import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body:  Body(),
    );
  }
}
