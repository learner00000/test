import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("large screen"),
      ],
    );
  }
}
