import 'package:flutter/material.dart';
import 'package:front_bs/screens/admins/widgets/admins.dart';
import 'package:front_bs/screens/users/users.dart';
import '../screens/users/users.dart';
import '../screens/admins/admins.dart';
import '../screens/home_screen/home.dart';
import '/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return _getPageRoute(HomeScreen());
    case adminsScreenRoute:
      return _getPageRoute(AdminsScreen());
    case usersScreenRoute:
      return _getPageRoute(UsersScreen());
    default:
      return _getPageRoute(HomeScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
