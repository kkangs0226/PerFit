import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = './userProfileScreen';
  final bool isEmployer;
  final FirebaseUser currentUser;

  UserProfileScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('user profile'),
    );
  }
}
