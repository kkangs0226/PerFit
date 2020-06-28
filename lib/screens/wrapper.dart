import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../screens/authenticate/login_screen.dart';
import '../screens/home/tabs_screen.dart';

class Wrapper extends StatelessWidget {
  static const routeName = '/wrapperPage';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ? LoginScreen() : TabsScreen();
  }
}
