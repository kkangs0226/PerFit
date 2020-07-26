import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../widgets/loading.dart';
import '../../home/chat_bar/chat_screen.dart';
import '../../../models/chat.dart';

class ChatListScreen extends StatelessWidget {
  static const routeName = './chatListScreen';
  final bool isEmployer;
  final FirebaseUser currentUser;

  ChatListScreen(this.isEmployer, this.currentUser);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: isEmployer
          ? Firestore.instance
              .collection('employers')
              .document(currentUser.uid)
              .collection('chats')
              .orderBy('createdAt')
              .snapshots()
          : Firestore.instance
              .collection('students')
              .document(currentUser.uid)
              .collection('chats')
              .orderBy('createdAt')
              .snapshots(),
      builder: (ctx, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return ListView.builder(
          itemCount: snapshots.data.documents.length,
          itemBuilder: (ctx, index) {
            String imageUrl = snapshots.data.documents[index]['imageUrl'];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ChatScreen.routeName,
                  arguments: Chat(
                    snapshots.data.documents[index].documentID,
                    snapshots.data.documents[index]['name'],
                    isEmployer,
                    imageUrl,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        Positioned(
                          top: 15,
                          left: 100,
                          child: Text(
                            snapshots.data.documents[index]['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Positioned(
                          top: 50,
                          left: 100,
                          child: Text(
                            snapshots.data.documents[index]['text'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
