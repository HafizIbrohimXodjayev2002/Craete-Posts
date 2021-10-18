import 'package:createposts/size_config.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class NoPostsYet extends StatelessWidget {
  const NoPostsYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DelayedDisplay(
      slidingCurve: Curves.easeOut,
      slidingBeginOffset: Offset(0.8, 0.1),
      delay: Duration(milliseconds: 350),
      fadingDuration: Duration(milliseconds: 900),
      child: Container(
        height: getProportionateScreenHeight(325),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/task.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "No Posts yet....",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
