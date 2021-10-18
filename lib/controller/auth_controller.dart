import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:createposts/screens/home/home_screen.dart';
import 'package:createposts/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Rxn<User?> _firebaseUser = Rxn<User>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? userUid;
  GoogleSignInAccount? googleUser;
  String? uid1;

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  void signUp() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        userUid = value.user!.uid;
        addToFirestore(
            uid: userUid,
            name: nameController.text,
            email: emailController.text);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Error creating account", "such as email is avialable",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getFirestoreData({
    required final String title,
    final String? description,
    final String? data,
  }) async {
    firebaseFirestore.collection('users').get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        firebaseFirestore.collection('posts').doc().set(
          {
            "title": title,
            "description": description,
            "data": data,
            "name": value.docs[i]['name'],
            "uid": value.docs[i]['uid'],
          },
        ).then((value) => print("Malumotlar qo'shildi!"));
      }
    });
  }

  void signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Error signing in", "wrong email or password",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() {
    try {
      _firebaseAuth.signOut();
      Get.offAll(SignInScreen());
    } catch (e) {
      Get.snackbar("Error signing out", "user did not come",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  googleSignIn() async {
    googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
    var _googleQiligan = await _firebaseAuth.signInWithCredential(credential);
    if (credential.accessToken != null) {
      Get.offAll(HomeScreen());
    } else {
      return null;
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void addToFirestore({
    var name,
    var email,
    String? uid,
  }) async {
    firebaseFirestore.collection("users").doc().set(
      {
        "name": name,
        "uid": uid,
        "email": email,
      },
      SetOptions(merge: true),
    ).then((value) => print("Qo'shildi -----------------------"));
  }

  clearAll() {
    passwordController.clear();
    emailController.clear();
  }
}
