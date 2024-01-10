import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mySHOP/controllers/signInStatus_controller.dart';
import 'package:mySHOP/views/added_product_list.dart';
import 'package:mySHOP/views/auth/login_page.dart';
import 'package:mySHOP/views/home_page.dart';
import 'package:mySHOP/views/search_page.dart';
import 'package:mySHOP/views/user_profile_page.dart';


class RouteGenerator {
  static IsSignInController isSignInController = Get.find();
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
      case '/cart':
        return MaterialPageRoute(builder: (context) => AddedList());
      case '/profile':
        return MaterialPageRoute(builder: (context) => UserProfile());

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
