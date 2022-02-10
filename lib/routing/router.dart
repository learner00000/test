import 'package:flutter/material.dart';
import 'package:front_bs/screens/auth_screen/authentication.dart';
import '../screens/home_screen/home.dart';
import '/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return _getPageRoute(HomeScreen());
    case authenticationScreenRoute:
      return _getPageRoute(AuthenticationScreen());
    default:
      return _getPageRoute(AuthenticationScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
