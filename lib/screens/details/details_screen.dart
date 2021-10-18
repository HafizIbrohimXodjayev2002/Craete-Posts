import 'package:createposts/screens/details/components/body.dart';
import 'package:createposts/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  String? image;
  int? index;
  DetailsScreen({this.image, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        image: image,
        index : index,
      ),
    );
  }
}
