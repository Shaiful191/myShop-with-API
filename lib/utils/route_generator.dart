import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_shirt_world/controller/signInStatus_controller.dart';
import 'package:t_shirt_world/pages/auth/login_page.dart';
import 'package:t_shirt_world/pages/home_page.dart';
import 'package:t_shirt_world/pages/search_page.dart';

class RouteGenerator {
  static  IsSignInController isSignInController = Get.find();
  //  final IsSignInController isSignInController = Get.put(IsSignInController());

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Obx(() {
            return isSignInController.isSignedIn == true
                ? const HomePage()
                : const LoginPage();
          }),
        );
      case '/search':
        return MaterialPageRoute(builder: (context) => SearchPage());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("Not found ${settings.name}"),
                  ),
                ));
    }
  }
}
