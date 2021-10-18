import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:createposts/constants.dart';
import 'package:createposts/controller/auth_controller.dart';
import 'package:createposts/screens/details/details_screen.dart';
import 'package:createposts/screens/home/components/no_posts_yet.dart';
import 'package:createposts/screens/home/components/tab_bar.dart';
import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:delayed_display/delayed_display.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  AuthController controller = Get.find();

  Stream<QuerySnapshot> snapshotData =
      FirebaseFirestore.instance.collection("posts").snapshots();
   Stream<QuerySnapshot> snapshotData1 =
      FirebaseFirestore.instance.collection("users").snapshots();
    

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM yyyy').format(now);
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopOfHome(),
            SizedBox(height: getProportionateScreenHeight(40.0)),
            DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              slidingBeginOffset: Offset(0.8, 0.1),
              delay: Duration(milliseconds: 200),
              child: Text(
                "$formattedDate",
                style: TextStyle(fontSize: getProportionateScreenWidth(15)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(7),
            ),
            DelayedDisplay(
              slidingCurve: Curves.easeOut,
              slidingBeginOffset: Offset(0.8, 0.1),
              delay: Duration(milliseconds: 350),
              fadingDuration: Duration(milliseconds: 900),
              child: StreamBuilder<QuerySnapshot>(
                stream: snapshotData1,
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Text(
                    "Hello, ${snapshot.data!.docs.length == 0 ? "Unknown" : snapshot.data!.docs[0]['name']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(23),
                        color: Colors.black),
                  );
                }
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            BuidTabBar(tabController: tabController),
            SizedBox(height: getProportionateScreenHeight(40)),
            buildPopularCategory(),
            SizedBox(height: getProportionateScreenHeight(25)),
            Container(
              height: getProportionateScreenHeight(325),
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: snapshotData,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());  
                  }
                  else {
                    return snapshot.data!.docs.length == 0 ? NoPostsYet() : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                       return  GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(
                              image: images[index],
                              index: index,
                            ));
                          },
                          child: Container(
                            margin: index == 0
                                ? null
                                : EdgeInsets.only(
                                    left: getProportionateScreenWidth(10)),
                            width: getProportionateScreenWidth(270),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(10),
                                left: getProportionateScreenWidth(10),
                                right: getProportionateScreenWidth(10),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: getProportionateScreenHeight(110),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: getProportionateScreenHeight(13),
                                        left: getProportionateScreenWidth(13),
                                        right: getProportionateScreenWidth(13),
                                        bottom:
                                            getProportionateScreenHeight(13)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${snapshot.data!.docs[index]['title']}",
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${snapshot.data!.docs[index]['name']}",
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12),
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "5min Read",
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ) ; 
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildPopularCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DelayedDisplay(
          slidingCurve: Curves.easeOut,
          slidingBeginOffset: Offset(0.8, 0.1),
          delay: Duration(milliseconds: 350),
          child: Text(
            "Popular",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: getProportionateScreenWidth(25),
              color: Colors.black,
            ),
          ),
        ),
        DelayedDisplay(
          slidingCurve: Curves.easeOut,
          slidingBeginOffset: Offset(0.8, 0.1),
          delay: Duration(milliseconds: 350),
          fadingDuration: Duration(milliseconds: 900),
          child: Text(
            "view more",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              fontSize: getProportionateScreenWidth(13),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTopOfHome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DelayedDisplay(
          slidingCurve: Curves.easeOut,
          slidingBeginOffset: Offset(0.8, 0.1),
          delay: Duration(milliseconds: 350),
          child: Container(
            height: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                controller.signOut();
              },
              child: Icon(
                Icons.logout,
                size: 30,
                color: Colors.black38,
              ),
            ),
          ),
        ),
        DelayedDisplay(
          slidingCurve: Curves.easeOut,
          slidingBeginOffset: Offset(0.8, 0.1),
          delay: Duration(milliseconds: 350),
          fadingDuration: Duration(milliseconds: 900),
          child: Container(
            height: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(45),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Icon(
              Icons.search_outlined,
              size: 30,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
