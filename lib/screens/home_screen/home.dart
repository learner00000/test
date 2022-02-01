import 'package:flutter/material.dart';
import '../../constants/style.dart';
import '../../helpers/reponsive.dart';
import '../../constants/controllers.dart';
import '../../widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../screens/home_screen/widgets/home_cards_large.dart';
import '../../screens/home_screen/widgets/home_cards_medium.dart';
import '../../screens/home_screen/widgets/home_cards_small.dart';
// import '../../screens/home_screen/widgets/revenue_section_large.dart';
// import 'widgets/revenue_section_small.dart';
import 'package:front_bs/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('is auth?? home');
    return Container(
      child: Column(
        children: [
          // Obx(() => 
          Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: dark,
                    )),
              ],
            ),
          // ),
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  HomeCardsMediumScreen()
                else
                  HomeCardsLargeScreen()
              else
                HomeCardsSmallScreen(),
              // if (!ResponsiveWidget.isSmallScreen(context))
              //   //RevenueSectionLarge()
              //    Text('This is "home_screen" now!'),
              // else
              //   Text('This is "home_screen" now!'),
              // RevenueSectionSmall(),
              //AvailableDriversTable(),
            ],
          ))
        ],
      ),
    );
  }
}
