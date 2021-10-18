import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      color: Colors.white,
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: MenuState.home == selectedMenu ? Icon(Icons.home, size: getProportionateScreenWidth(32)) : Icon(Icons.home_outlined, size: getProportionateScreenWidth(32)),
                color: MenuState.home == selectedMenu
                    ? Colors.black
                    : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: MenuState.favourite == selectedMenu ? Icon(Icons.favorite, size: getProportionateScreenWidth(32)) : Icon(Icons.favorite_outline, size: getProportionateScreenWidth(32)),
                color: MenuState.favourite == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () {},
              ),
              SizedBox(width: 20,),
              IconButton(
                icon: MenuState.history == selectedMenu ? Icon(Icons.history, size: getProportionateScreenWidth(32)) : Icon(Icons.history_outlined, size: getProportionateScreenWidth(32)),
                color: MenuState.history == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: MenuState.profile == selectedMenu ? Icon(Icons.person, size: getProportionateScreenWidth(32)) : Icon(Icons.person_outline, size: getProportionateScreenWidth(32)),
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
