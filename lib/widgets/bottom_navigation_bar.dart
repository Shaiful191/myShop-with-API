import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_shirt_world/app_color.dart';
import 'package:t_shirt_world/controller/bottom_navigation_controller.dart';
import 'package:t_shirt_world/pages/added_product_list.dart';
import 'package:t_shirt_world/pages/home_page.dart';
import 'package:t_shirt_world/pages/search_page.dart';
import 'package:t_shirt_world/pages/user_profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final index;
  const CustomBottomNavigationBar({super.key,required this.index});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  
    // final BottomNavigationController bottomNavigationController =
    //   Get.put(BottomNavigationController());

  int _currentIndex = 0;
 _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (_currentIndex == 0) {

         Navigator.pushNamed(context, '/');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage()),
        // );
      } else if (_currentIndex == 1) {

         Navigator.pushNamed(context, '/search');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
      } else if (_currentIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddedList()),
        );
      } else if (_currentIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfile()),
        );
      }

      print(_currentIndex);
    });
  }
  //    onTabTapped(int index) {
  //   _currentIndex = index;

  //   if (index == 0) {

  //     Navigator.pushNamed(context, '/');

  //     //  navigatorKey.currentState?.pushNamed('/');

  //     // WidgetsBinding.instance.addPostFrameCallback((_) {
      

  //     //   // navigatorKey.currentState?.push(
  //     //   //   MaterialPageRoute(
  //     //   //     builder: (_) => HomePage(),
  //     //   //   ),
  //     //   // );
  //     // });

  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => HomePage()),
  //     // );
  //   } else if (_currentIndex.value == 1) {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => SearchPage()),
  //     // );
  //   } else if (_currentIndex.value == 2) {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => AddedList()),
  //     // );
  //   } else if (_currentIndex.value == 3) {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => UserProfile()),
  //     // );
  //   }
  // }
      
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 16,
      unselectedFontSize: 14,
      selectedItemColor: AppColors.secondary,
      selectedIconTheme: IconThemeData(
        color: AppColors.secondary,
      ),
      onTap:_onTabTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "You"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
    );
  
    
  }
}