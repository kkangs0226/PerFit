import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = './filterScreen';
  final bool isEmployer;
  final FirebaseUser currentUser;

  FilterScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('filter'));
  }
}
