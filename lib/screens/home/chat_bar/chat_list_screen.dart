import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatListScreen extends StatelessWidget {
  static const routeName = './chatListScreen';
  final bool isEmployer;
  final FirebaseUser currentUser;

  ChatListScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('chat list'));
  }
}
