import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = './filterScreen';
  final bool isEmployer;
  final DocumentSnapshot currentUser;

  FilterScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('filter'));
  }
}
