// import 'package:flutter/material.dart';
// import 'package:kazirdorver/features/profile/admin_and_guest_profile/Admin_profile_update/view/admin_profile_edit_home.dart';
// import 'package:kazirdorver/utils/appColor.dart';
// import 'package:kazirdorver/features/blog/view/bloghomePage.dart';
// import 'package:kazirdorver/features/home/admin_home_page.dart';
// import 'package:kazirdorver/features/home/guest_home_page.dart';
// import 'package:kazirdorver/features/home/kazi_home_page.dart';
// import 'package:kazirdorver/features/home/user_home_page.dart';
// import 'package:kazirdorver/features/news/view/newshomePage.dart';
// import 'package:kazirdorver/features/profile/admin_and_guest_profile/guest_profile.dart';
// import 'package:kazirdorver/features/profile/kazi_profile/kazi_profile_page.dart';
// import 'package:kazirdorver/features/profile/user_profile/user_profile_page.dart';
// import 'package:t_shirt_world/app_color.dart';

// class UserBottomNavigationBar extends StatefulWidget {
//   final int index;
//   final int home;
//   UserBottomNavigationBar({super.key, required this.index, required this.home});

//   @override
//   State<UserBottomNavigationBar> createState() =>
//       _UserBottomNavigationBarState();
// }

// class _UserBottomNavigationBarState extends State<UserBottomNavigationBar> {
 
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     if (index == 0) {
//   //       if (widget.home == 0) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => GuestHomePage()),
//   //         );
//   //       } else if (widget.home == 1) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => UserHomePage()),
//   //         );
//   //       } else if (widget.home == 2) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => KaziHomePage()),
//   //         );
//   //       } else if (widget.home == 3) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => AdminHomePage()),
//   //         );
//   //       }
//   //     } else if (index == 1) {
//   //       if (widget.home == 0 || widget.home == 1) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => BlogHome(
//   //                     visiable: false,
//   //                     k: widget.home,
//   //                   )),
//   //         );
//   //       } else if (widget.home == 2 || widget.home == 3) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => BlogHome(
//   //                     visiable: true,
//   //                     k: widget.home,
//   //                   )),
//   //         );
//   //       }
//   //     } else if (index == 2) {
//   //       if (widget.home == 0 || widget.home == 1) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => NewsHome(
//   //                     k: widget.home,
//   //                     visible: false,
//   //                   )),
//   //         );
//   //       } else if (widget.home == 2 || widget.home == 3) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => NewsHome(
//   //                     k: widget.home,
//   //                     visible: true,
//   //                   )),
//   //         );
//   //       }
//   //     } else if (index == 3) {

//   //       if (widget.home == 0) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => GuestProfilePage(),
//   //                   ),
//   //         );
//   //       } 
//   //       else if (widget.home == 1) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => UserProfilePage(
//   //                     k: widget.home,
//   //                   )),
//   //         );
//   //       } else if (widget.home == 2) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => KaziProfilePage(
//   //                     k: widget.home,
//   //                   )),
//   //         );
//   //       } else if (widget.home == 3) {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //               builder: (context) => AdminProfileEditHome(),
                
//   //             ),
//   //         );
//   //       }
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 //  color: AppColors.primary,
//               ),
//               label: 'Home',
//               // backgroundColor: _selectedIndex == 0 ? Colors.red : Colors.amber,
//               backgroundColor: AppColors.backgroundColor),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.article,
//                 // color: AppColors.primary,
//               ),
//               label: 'Blog',
//               backgroundColor: AppColors.backgroundColor),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.newspaper,
//                 //  color: AppColors.primary,
//               ),
//               label: 'News',
//               backgroundColor: AppColors.backgroundColor),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               //color: AppColors.primary,
//             ),
//             label: 'Profile',
//             backgroundColor: AppColors.backgroundColor,
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         currentIndex: widget.index,
//         selectedItemColor: AppColors.secondary,
//         selectedLabelStyle: TextStyle(fontSize: 18),
//         iconSize: 40,
//         // onTap: ,
//         showUnselectedLabels: true,
//         unselectedItemColor: AppColors.bottomNavigationUnselectedColor,
//         unselectedLabelStyle: TextStyle(
//           fontSize: 18,
//         ),
//         elevation: 5);
//   }
// }