import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_bar/chat_list_screen.dart';
import './filter_bar/filter_screen.dart';
import './forum_bar/forum_screen.dart';
import './home_bar/home_screen.dart';
import './profile_bar/user_profile_screen.dart';
import '../../widgets/loading.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool isEmployer;
  FirebaseUser currentUser;
  bool _isLoading;
  var _selectedPageIndex = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkIfEmployer();
  }

  Future<void> _checkIfEmployer() async {
    DocumentSnapshot result;
    setState(() {
      _isLoading = true;
    });
    currentUser = await FirebaseAuth.instance.currentUser();
    result = await Firestore.instance
        .collection('employers')
        .document(currentUser.uid)
        .get();
    if (result.exists) {
      isEmployer = true;
      print('success');
    } else {
      isEmployer = false;
      print('failure');
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _selectPage(int index) {
    setState(
      () {
        print(isEmployer);
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _pages = [
      {'page': HomeScreen(isEmployer, currentUser), 'title': 'PerFit!'},
      {'page': FilterScreen(isEmployer, currentUser), 'title': 'Filter'},
      {'page': ForumScreen(isEmployer, currentUser), 'title': 'Forum'},
      {'page': ChatListScreen(isEmployer, currentUser), 'title': 'Chat Lists'},
      {
        'page': UserProfileScreen(isEmployer, currentUser),
        'title': 'User Profile'
      },
    ];

    final PreferredSizeWidget mainAppBar = AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => _auth.signOut(),
        )
      ],
      title: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Text(
              _pages[_selectedPageIndex]['title'],
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );

    final PreferredSizeWidget appBar = AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => _auth.signOut(),
        )
      ],
      title: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        alignment: Alignment.center,
        child: Text(
          _pages[_selectedPageIndex]['title'],
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      /*title: Text(_pages[_selectedPageIndex]['title']),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.undo),
          onPressed: () async {
            await _auth.signOut();
            print('Signing out...');
          },
        ),
      ],*/
    );

    return Scaffold(
      appBar: _selectedPageIndex == 0 ? mainAppBar : appBar,
      body: _isLoading ? Loading() : _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.blue[900],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            title: Text('Filter'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            title: Text('Forum'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            //title: Padding(padding: EdgeInsets.all(0)),
          ),
        ],
      ),
    );
  }
}
