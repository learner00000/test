import 'package:flutter/material.dart';
import 'package:front_bs/controllers/auth_controller.dart';
import 'package:get/get.dart';

import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';

import 'constants/style.dart';
import 'layout.dart';
import 'screens/404_screen/error.dart';
import 'screens/auth_screen/authentication.dart';
import 'screens/home_screen/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routing/routes.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(AuthController());
  Get.put(AuthCard);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          initialRoute: AuthController.instance.isAuth
              ? homeScreenRoute
              : authenticationScreenRoute,
          unknownRoute: GetPage(
              name: '/not-found',
              page: () => PageNotFound(),
              transition: Transition.fadeIn),
          getPages: [
            GetPage(
                name: rootRoute,
                page: () {
                  return SiteLayout();
                }),
            GetPage(
                name: authenticationScreenRoute,
                page: () => const AuthenticationScreen()),
            GetPage(name: homeScreenRoute, page: () => const HomeScreen()),
          ],
          debugShowCheckedModeBanner: false,
          title: 'BasicCode',
          theme: ThemeData(
            scaffoldBackgroundColor: light,
            textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            }),
            primarySwatch: Colors.blue,
          ),
        ));
  }
}


///


// class AuthMiddlware extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String route) => !AuthController.instance.isAuth
//       ? const RouteSettings(name: authenticationScreenRoute)
//       : null;
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }



