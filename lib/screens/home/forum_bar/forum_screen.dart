import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForumScreen extends StatelessWidget {
  static const routeName = './forumScreen';
  final bool isEmployer;
  final FirebaseUser currentUser;

  ForumScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('forum'),
    );
  }
}
