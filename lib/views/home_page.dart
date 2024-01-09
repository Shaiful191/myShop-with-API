import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_shirt_world/utils/app_color.dart';
import 'package:t_shirt_world/controllers/bottom_navigation_controller.dart';
import 'package:t_shirt_world/helper/helper.dart';
import 'package:t_shirt_world/views/auth/login_page.dart';
import 'package:t_shirt_world/views/product_details.dart';
import 'package:t_shirt_world/views/search_page.dart';
import 'package:t_shirt_world/views/user_profile_page.dart';
import 'package:t_shirt_world/service/auth_service.dart';
import 'package:t_shirt_world/componants/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String userName = "";
  // String email = "";

  // AuthService authService = AuthService();

  // gettingUserData() async {
  //   await HelperFuctions.getUserEmailFormSF().then((value) {
  //     setState(() {
  //       email = value!;
  //     });
  //   });
  //   await HelperFuctions.getUserNameFormSF().then((value) {
  //     setState(() {
  //       userName = value!;
  //     });
  //   });
  // }

  // List<String> _carouselImages = [];

  // var _firestoreInstance = FirebaseFirestore.instance;

  // fetchCarouselImages() async {
  //   QuerySnapshot qn =
  //       await _firestoreInstance.collection("carousel-slider").get();
  //   setState(() {
  //     for (int i = 0; i < qn.docs.length; i++) {
  //       _carouselImages.add(
  //         qn.docs[i]["img-path"],
  //       );
  //     }
  //   });

  //   return qn.docs;
  // }

  // fetchProducts() async {
  //   QuerySnapshot qn = await _firestoreInstance.collection("products").get();
  //   setState(() {
  //     for (int i = 0; i < qn.docs.length; i++) {}
  //   });

  //   return qn.docs;
  // }

  @override
  void initState() {
    // fetchCarouselImages();
    // fetchProducts();
    super.initState();
  }

  // Widget drawerItem({required String name, required IconData icon}) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       color: Colors.white,
  //     ),
  //     title: Text(
  //       name,
  //       style: TextStyle(fontSize: 20, color: Colors.white),
  //     ),
  //   );
  // }

  // final BottomNavigationController bottomNavigationController =
  //     Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     padding: const EdgeInsets.symmetric(vertical: 50),
      //     children: [
      //       Icon(
      //         Icons.account_circle,
      //         size: 150,
      //         color: Colors.grey[700],
      //       ),
      //       const SizedBox(
      //         height: 15,
      //       ),
      //       Text(
      //         userName,
      //         textAlign: TextAlign.center,
      //         style: const TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(
      //         height: 30,
      //       ),
      //       const Divider(
      //         height: 2,
      //       ),
      //       ListTile(
      //         onTap: () {},
      //         selected: true,
      //         selectedColor: Theme.of(context).primaryColor,
      //         contentPadding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         leading: const Icon(Icons.group),
      //         title:
      //             const Text("Groups", style: TextStyle(color: Colors.black)),
      //       ),

      //       // ListTile(
      //       //   onTap: () {
      //       //     nextScreenReplace(
      //       //         context,
      //       //         ProfilePage(
      //       //           username: userName,
      //       //           email: email,
      //       //         ));
      //       //   },
      //       //   contentPadding:
      //       //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //       //   leading: const Icon(Icons.person),
      //       //   title:
      //       //       const Text("Profile", style: TextStyle(color: Colors.black)),
      //       // ),

      //       ListTile(
      //         onTap: () async {
      //           showDialog(
      //               //  barrierDismissible: false,
      //               context: context,
      //               builder: (context) {
      //                 return AlertDialog(
      //                   title: const Text("Logout"),
      //                   content: const Text("Are you sure you want to logout?"),
      //                   actions: [
      //                     Container(
      //                         child: ElevatedButton(
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: Colors.red,
      //                       ),
      //                       child: const Text('Cancel'),
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                     )),
      //                     Container(
      //                         child: ElevatedButton(
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: Colors.green,
      //                       ),
      //                       child: const Text('Ok'),
      //                       onPressed: () async {
      //                         await authService.signOut();
      //                         Navigator.of(context).pushAndRemoveUntil(
      //                             MaterialPageRoute(
      //                                 builder: (context) => const LoginPage()),
      //                             (route) => false);
      //                       },
      //                     )),
      //                   ],
      //                 );
      //               });
      //           // authService.signOut().whenComplete(() {
      //           //   nextScreenReplace(context, const LoginPage());
      //           // });
      //         },
      //         contentPadding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         leading: const Icon(Icons.exit_to_app),
      //         title:
      //             const Text("Logout", style: TextStyle(color: Colors.black)),
      //       ),
      //     ],
      //   ),
      // ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              title: Text(
                "Hi,Shaiful!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "What would you buy today?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: (Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 30,
                )),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              height: height * 0.12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy the special offer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "up to 60%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "at 15-25 january 2024",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SubHeadline(
              leadingName: "Categories",
              trailingName: "See All",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    width: width,
                    height: height,
                    color: Color(0xffFEDEDF),
                    categoriesName: "Fruit",
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  CategoriesCard(
                    width: width,
                    height: height,
                    color: Color(0xffFFEAC3),
                    categoriesName: "Bread",
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  CategoriesCard(
                    width: width,
                    height: height,
                    color: Color(0xffCEE7D4),
                    categoriesName: "Veggie",
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  CategoriesCard(
                    width: width,
                    height: height,
                    color: Color(0xffFFFCCF),
                    categoriesName: "Dairy",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SubHeadline(
              leadingName: "Best Selling",
              trailingName: "See All",
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(0),
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    height: height * 0.16,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.04,
                        top: height * 0.02,
                        bottom: height * 0.02,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffCEE7D4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: width * 0.26,
                            height: height * 0.12,
                            child: Icon(
                              Icons.food_bank,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Container(
                            width: width * 0.36,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Orange Fresh Juice",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "It dummy reasonable to laying Lorem words to.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Tk.550",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.002,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              padding: EdgeInsets.only(
                                left: width * 0.02,
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:
          CustomBottomNavigationBar(),
    );
  }
}

class SubHeadline extends StatelessWidget {
  final String leadingName;
  final String trailingName;
  SubHeadline({
    super.key,
    required this.leadingName,
    required this.trailingName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            trailingName,
            style: TextStyle(
              fontSize: 18,
              color: const Color.fromARGB(255, 94, 87, 87),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.categoriesName,
  });

  final double width;
  final double height;
  final Color color;
  final String categoriesName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      width: width * 0.20,
      height: height * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.food_bank,
            size: 40,
            color: AppColors.primary,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            categoriesName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
