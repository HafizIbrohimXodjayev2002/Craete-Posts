import 'package:createposts/controller/binding/authBindings.dart';
import 'package:createposts/dartTime.dart';
import 'package:createposts/screens/details/details_screen.dart';
import 'package:createposts/screens/home/home_screen.dart';
import 'package:createposts/screens/sign_in/sign_in_screen.dart';
import 'package:createposts/screens/splash/splash_screen.dart';
import 'package:createposts/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: AnimatedSpalsh(),
    );
  }
}