import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  String? image;
  int? index;
  Body({this.image, this.index});

  Stream<QuerySnapshot> snapshotData =
      FirebaseFirestore.instance.collection("posts").snapshots();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM yyyy').format(now);
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: snapshotData,
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else{
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(
                    "${snapshot.data!.docs[index!]['data']}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Text(
                    "${snapshot.data!.docs[index!]['title']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Container(
                    height: getProportionateScreenHeight(230),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("$image"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Text(
                    "${snapshot.data!.docs[index!]['description']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Text(
                    "Poted by ${snapshot.data!.docs[index!]['name']}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                ],
              );
              }
            }
          ),
        ),
      ),
    );
  }
}
