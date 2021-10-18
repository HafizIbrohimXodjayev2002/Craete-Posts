import 'package:createposts/screens/create_posts/components/body.dart';
import 'package:flutter/material.dart';

class CreatePostsScreen extends StatelessWidget {
  const CreatePostsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}