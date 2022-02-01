import 'package:flutter/material.dart';
import '/helpers/local_navigator.dart';
import '/widgets/side_menu.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: localNavigator(),
    );
    // //Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Expanded(child: SideMenu()),
    //     Expanded(
    //         flex: 5,
    //         child: Container(
    //           margin: EdgeInsets.symmetric(horizontal: 16),
    //           child: localNavigator(),
    //         ))
    //   ],
    // );
  }
}
