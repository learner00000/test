import 'package:flutter/material.dart';
import '/helpers/local_navigator.dart';
import 'helpers/reponsive.dart';
import '/widgets/large_screen.dart';
import '/widgets/medium_screen.dart';
import '/widgets/small_screen.dart';
import '/widgets/side_menu.dart';

import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: MediumScreen(),
        smallScreen: SmallScreen(),
        // smallScreen: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: localNavigator(),
        // ),
        customScreen: LargeScreen(),
      ),
    );
  }
}
