import 'package:flutter/material.dart';

import './chat_bar/chat_screen.dart';
import './filter_bar/filter_screen.dart';
import './forum_bar/forum_screen.dart';
import './home_bar/home_screen.dart';
import './profile_bar/user_profile_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  var _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'PerFit!'},
      {'page': FilterScreen(), 'title': 'Filter'},
      {'page': ForumScreen(), 'title': 'Forum'},
      {'page': ChatScreen(), 'title': 'Chat Lists'},
      {'page': UserProfileScreen(), 'title': 'User Profile'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget mainAppBar = AppBar(
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
    );

    return Scaffold(
      appBar: _selectedPageIndex == 0 ? mainAppBar : appBar,
      body: _pages[_selectedPageIndex]['page'],
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
