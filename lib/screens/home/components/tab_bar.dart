import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BuidTabBar extends StatelessWidget {
  const BuidTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      labelColor: Colors.white,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelColor: Color(0xff3c4046),
      indicatorColor: Colors.black,
      indicator: BubbleTabIndicator(
        indicatorRadius: 10,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        indicatorHeight: 40.0,
        indicatorColor: Colors.black,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: [
        Tab(
          child: DelayedDisplay(
            slidingCurve: Curves.easeOut,
            slidingBeginOffset: Offset(0.5, -3),
            delay: Duration(milliseconds: 350),
            fadingDuration: Duration(milliseconds: 900),
            child: Text(
              "All Topics",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
        ),
        Tab(
          child: DelayedDisplay(
            slidingCurve: Curves.easeOut,
            slidingBeginOffset: Offset(0.5, -3),
            delay: Duration(milliseconds: 350),
            child: Text(
              "Technology",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
        ),
        Tab(
          child: DelayedDisplay(
            slidingCurve: Curves.easeOut,
            slidingBeginOffset: Offset(0.5, -3),
            delay: Duration(milliseconds: 350),
            child: Text(
              "Design",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
        ),
        Tab(
          child: DelayedDisplay(
            slidingCurve: Curves.easeOut,
            slidingBeginOffset: Offset(0.5, -3),
            delay: Duration(milliseconds: 350),
            child: Text(
              "Sport",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
        ),
        Tab(
          child: DelayedDisplay(
            slidingCurve: Curves.easeOut,
            slidingBeginOffset: Offset(0.5, -3),
            delay: Duration(milliseconds: 350),
            child: Text(
              "Art",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
