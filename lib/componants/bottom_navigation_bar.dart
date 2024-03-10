import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mySHOP/utils/app_color.dart';
import 'package:mySHOP/controllers/bottom_navigation_controller.dart';

import 'package:mySHOP/views/home_page.dart';
import 'package:mySHOP/views/search_page.dart';
import 'package:mySHOP/views/user_profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  // final index;
  // var currentIndex;
  CustomBottomNavigationBar({
    super.key,
    //  required this.index,
    //  this.currentIndex,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  // final BottomNavigationController bottomNavigationController =
  //   Get.put(BottomNavigationController());
  int currentIndex = 0;

  _onTabTapped(int index) {
    setState(() {
      currentIndex = index;

      if (currentIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
       // Navigator.pushNamed(context, '/');
      } else if (currentIndex == 1) {
         showSearch(context: context, delegate: SearchPage());
      //  Navigator.pushNamed(context, '/search');
      } else if (currentIndex == 2) {
        Navigator.pushNamed(context, '/cart');
      } else if (currentIndex == 3) {
        Navigator.pushNamed(context, '/profile');
      }

      print(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 16,
      unselectedFontSize: 14,
      selectedItemColor: AppColors.secondary,
      selectedIconTheme: IconThemeData(
        color: AppColors.secondary,
      ),
      onTap: _onTabTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "You"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
    );
  }
}
