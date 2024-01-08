//   import 'package:flutter/material.dart';
// import 'package:get/get.dart';


//   class BottomNavigationController extends GetxController{
//     BottomNavigationBar _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       selectedFontSize: 16,
//       unselectedFontSize: 14,
//       selectedItemColor: AppColors.secondary,
//       selectedIconTheme: IconThemeData(
//         color: AppColors.secondary,
//       ),
//       onTap: _onTabTapped,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
//         BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "You"),
//       ],
//       type: BottomNavigationBarType.fixed,
//       currentIndex: _currentIndex,
//     );
//   }

//   _onTabTapped(int index,) {
//     setState(() {
//       _currentIndex = index;

//       if (_currentIndex == 0) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } else if (_currentIndex == 1) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SearchPage()),
//         );
//       } else if (_currentIndex == 2) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AddedList()),
//         );
//       } else if (_currentIndex == 3) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => UserProfile()),
//         );
//       }

//      // print(_currentIndex);
//     });
//   }

  
// }


