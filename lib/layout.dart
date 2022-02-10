import 'package:flutter/material.dart';
import '/widgets/large_screen.dart';
import '/widgets/medium_screen.dart';
import '/widgets/small_screen.dart';
import 'helpers/reponsive.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar (title: Text("Welcome!") ),

      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: MediumScreen(),
        smallScreen: SmallScreen(),
        customScreen: LargeScreen(),
      ),
    );
  }
}
