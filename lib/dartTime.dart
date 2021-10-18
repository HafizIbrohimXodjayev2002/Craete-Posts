import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DartTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm \n EEE d MMM \n').format(now);
    return Scaffold(
      body: Center(
        child: Text("$formattedDate", textAlign: TextAlign.center,),
      ),
    );
  }
}