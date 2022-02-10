import 'package:flutter/material.dart';
// import 'info_card_small.dart';

class HomeCardsSmallScreen extends StatelessWidget {
  const HomeCardsSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return const Text('this is home screen small!');

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Home"),
    //   ),
    //   body: const Text('this is home screen medium!'),
    // );
  }
}
