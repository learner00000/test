import 'package:flutter/material.dart';
import '../../../constants/style.dart';
// import 'package:flutter_we/home/widgets/info_card.dart';

class HomeCardsMediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(child: Text('this is home screen medium!')
        // mainAxisSize: MainAxisSize.min,
        // children: [
        //   Row(
        //     children: [
        //       InfoCard(
        //         title: "Rides in progress",
        //         value: "7",
        //         onTap: () {},
        //         topColor: Colors.orange,
        //       ),
        //       SizedBox(
        //         width: _width / 64,
        //       ),
        //       InfoCard(
        //         title: "Packages delivered",
        //         value: "17",
        //         topColor: Colors.lightGreen,
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        //   SizedBox(
        //     height: _width / 64,
        //   ),
        //   Row(
        //     children: [
        //       InfoCard(
        //         title: "Cancelled delivery",
        //         value: "3",
        //         topColor: Colors.redAccent,
        //         onTap: () {},
        //       ),
        //       SizedBox(
        //         width: _width / 64,
        //       ),
        //       InfoCard(
        //         title: "Scheduled deliveries",
        //         value: "32",
        //         onTap: () {},
        //         topColor: light,
        //       ),
        //     ],
        //   ),
        // ],
        );
  }
}
