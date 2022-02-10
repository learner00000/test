import 'package:flutter/material.dart';
import 'package:front_bs/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'constants/style.dart';
import 'layout.dart';
import 'screens/404_screen/error.dart';
import 'screens/auth_screen/authentication.dart';
import 'screens/home_screen/home.dart';
import 'routing/routes.dart';

void main() async {
  Get.put(AuthController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: authenticationScreenRoute,
            page: () => const AuthenticationScreen()),
        GetPage(name: homeScreenRoute, page: () => const HomeScreen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'BasicCode',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      home: Obx(() => AuthController.instance.isAuth
          ? const HomeScreen()
          : const AuthenticationScreen()),
    );
  }
}
