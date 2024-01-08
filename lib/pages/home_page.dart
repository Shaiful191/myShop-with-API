import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:t_shirt_world/app_color.dart';
import 'package:t_shirt_world/helper/helper.dart';
import 'package:t_shirt_world/pages/auth/login_page.dart';
import 'package:t_shirt_world/pages/product_details.dart';
import 'package:t_shirt_world/service/auth_service.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  var _dotPosition = 0;

  AuthService authService = AuthService();

  gettingUserData() async {
    await HelperFuctions.getUserEmailFormSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFuctions.getUserNameFormSF().then((value) {
      setState(() {
        userName = value!;
      });
    });

    // //getting the list of snapshots in our stream
    // await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
    //     .getUserGroups()
    //     .then((snapshot) {
    //   setState(() {
    //     groups = snapshot;
    //   });
    // });
  }

  List<String> _carouselImages = [];

  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        // print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        // products.add({
        //   "product-name": qn.docs[i]["product-name"],
        //   "product-description": qn.docs[i]["product-description"],
        //   "product-price": qn.docs[i]["product-price"],
        //   "product-img": qn.docs[i]["product-img"],
        // });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    //load hoyar sathe sathe jeano kaj kore.
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  int _currentIndex = 0;
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      // backgroundColor: Colors.teal,
      selectedFontSize: 16,
      unselectedFontSize: 14,

      selectedItemColor: AppColors.secondary,
      selectedIconTheme: IconThemeData(
        color: AppColors.secondary,
      ),
      onTap: _onTabTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: "Wishlist"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "You"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   title: const Text(
      //     'T-Shirt World',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 2.5,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),

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

      //     drawer: Drawer(
      //   child: Container(
      //     color: Color(0xff2b2b2b),
      //     child: SafeArea(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           UserAccountsDrawerHeader(
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 fit: BoxFit.cover,
      //                 image: AssetImage('images/background.jpg'),
      //               ),
      //             ),
      //             currentAccountPicture: CircleAvatar(
      //               backgroundImage: AssetImage('images/profile.jpg'),
      //             ),
      //             accountName: Text("Shaiful Islam"),
      //             accountEmail: Text("islamslamshaiful26@gmail.com"),
      //           ),
      //           drawerItem(icon: Icons.person, name: "Profile"),
      //           GestureDetector(
      //           onTap: (){

      //             // Navigator.push(
      //             //  context,
      //             //  MaterialPageRoute(builder: (context) => AddedList()),
      //             //  );

      //           },
      //           child: drawerItem(icon: Icons.add_shopping_cart, name: "Cart"),
      //           ),
      //           drawerItem(icon: Icons.shop, name: "Order"),

      //            GestureDetector(
      //           onTap: (){
      //             Navigator.push(context, CupertinoPageRoute(builder: (_)=>AboutUs()));
      //           },
      //           child: drawerItem(icon: Icons.contact_page, name: "Contact Us"),
      //           ),
      //           Divider(
      //             thickness: 2,
      //             color: Colors.white,
      //           ),
      //           ListTile(
      //             leading: Text(
      //               "Comunicate",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20,
      //               ),
      //             ),
      //           ),
      //           drawerItem(icon: Icons.lock, name: "Change"),
      //           drawerItem(icon: Icons.exit_to_app, name: "Log Out"),
      //         ],
      //       ),
      //     ),
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
            // SizedBox(
            //   height: height * 0.01,
            // ),

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
                        //fontWeight: FontWeight.w500,
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
            // SizedBox(
            //   height: height * 0.02,
            // ),
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

            // SizedBox(
            //   height: height * 0.015,
            // ),

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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
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
                                    //fontSize: 16,
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
                                // top: height * 0.02,
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

      bottomNavigationBar: _buildBottomNavigationBar(),
      // SafeArea(
      //     child: Container(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         // height: 10.sp,
      //         height: 10,
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(
      //           left: 20,
      //           right: 20,
      //           //   left: 20.w,
      //           //  right: 20.w
      //         ),
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Container(
      //               height: 50,
      //               width: 260,
      //               // height: 50.h,
      //               // width: 260.w,
      //               child: TextFormField(
      //                 readOnly: true,
      //                 decoration: InputDecoration(
      //                   fillColor: Colors.white,
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(Radius.circular(0)),
      //                       borderSide: BorderSide(color: Colors.blue)),
      //                   enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(Radius.circular(0)),
      //                       borderSide: BorderSide(color: Colors.grey)),
      //                   hintText: "Search products here",
      //                   hintStyle: TextStyle(
      //                     fontSize: 15,
      //                     //  fontSize: 15.sp,
      //                   ),
      //                 ),
      //                 onTap: () {
      //                   // Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchScreen()),),
      //                 },
      //               ),
      //             ),
      //             Spacer(),
      //             IconButton(
      //                 onPressed: () {
      //                   // Navigator.push(context,
      //                   //     CupertinoPageRoute(builder: (_) => AddedList()));
      //                 }, // snapshot.data.docs.length == 0 ? addToFavourite() : print("Already Added"),
      //                 icon: //snapshot.data.docs.length == 0
      //                     Icon(
      //                   Icons.shopping_cart,
      //                   color: Colors.blueAccent,
      //                   size: 40,
      //                   // size: 40.sp,
      //                 )
      //                 //     : Icon(
      //                 //   Icons.favorite,
      //                 //   color: Colors.white,
      //                 // ),
      //                 ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //         // height: 10.h,
      //       ),
      //       AspectRatio(
      //         aspectRatio: 3.5,
      //         child: CarouselSlider(
      //             items: _carouselImages
      //                 .map((item) => Padding(
      //                       padding: const EdgeInsets.only(left: 3, right: 3),
      //                       child: Container(
      //                         decoration: BoxDecoration(
      //                             image: DecorationImage(
      //                                 image: NetworkImage(item),
      //                                 fit: BoxFit.fitWidth)),
      //                       ),
      //                     ))
      //                 .toList(),
      //             options: CarouselOptions(
      //                 autoPlay: false,
      //                 enlargeCenterPage: true,
      //                 viewportFraction: 0.8,
      //                 enlargeStrategy: CenterPageEnlargeStrategy.height,
      //                 onPageChanged: (val, carouselPageChangedReason) {
      //                   setState(() {
      //                     _dotPosition = val;
      //                   });
      //                 })),
      //       ),
      //       SizedBox(
      //         // height: 10.h,
      //         height: 10,
      //       ),
      //       DotsIndicator(
      //         dotsCount:
      //             _carouselImages.length == 0 ? 1 : _carouselImages.length,
      //         position: _dotPosition.toInt(),
      //         // position: _dotPosition.toDouble(),
      //         decorator: DotsDecorator(
      //           activeColor: Colors.blueAccent,
      //           color: Colors.blueAccent.withOpacity(0.5),
      //           spacing: EdgeInsets.all(2),
      //           activeSize: Size(8, 8), //height:8,width:8
      //           size: Size(6, 6),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //         // height: 15.h,
      //       ),
      //       Row(
      //         children: [
      //           Text(
      //             'Top Products',
      //             style: TextStyle(color: Colors.blue, fontSize: 30),
      //           ),
      //           Spacer(),
      //           TextButton(
      //             // style: TextButton.styleFrom(
      //             //   primary: Colors.deepOrange,
      //             //   elevation: 10,
      //             //   shadowColor: Colors.white,
      //             // ),
      //             onPressed: () {
      //               // Navigator.push(
      //               //     context, MaterialPageRoute(builder: (_) => View_all()));
      //             },

      //             child: Text('View All',
      //                 style: TextStyle(fontSize: 30, color: Colors.blue)),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 10,
      //         //height: 15.h,
      //       ),
      //       Expanded(
      //         child: GridView.builder(
      //             scrollDirection: Axis.vertical,
      //             // itemCount: products.length,
      //             itemCount: 8,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 childAspectRatio: 1,
      //                 mainAxisSpacing: 8,
      //                 crossAxisSpacing: 8),
      //             itemBuilder: (_, index) {
      //               return GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (_) => ProductDetails(
      //                             // 1,
      //                             // products[index],
      //                             )),
      //                   );
      //                 },
      //                 child: Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: Card(
      //                     color: AppColors.primary,
      //                     elevation: 3,
      //                     child: Column(
      //                       children: [
      //                         AspectRatio(
      //                             aspectRatio: 1.5,
      //                             child: Container(
      //                               color: AppColors.primary,
      //                               child: Image.asset(
      //                                 "assets/t_shirt_world_logo.jpg",
      //                                 fit: BoxFit.cover,
      //                               ),
      //                               // Image.network(
      //                               //   products[index]["product-img"],
      //                               //   fit: BoxFit.cover,
      //                               // ),
      //                             )),
      //                         SizedBox(
      //                           height: 10,
      //                           //height: 15.sp
      //                         ),
      //                         Text(
      //                           "Product Name",
      //                           // "${products[index]["product-name"]}",
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontWeight: FontWeight.bold),
      //                         ),
      //                         Text("550",
      //                             // "${products[index]["product-price"].toString()}",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontWeight: FontWeight.bold)),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }),
      //       ),
      //     ],
      //   ),
      // )),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: AppColors.primary,
    //     title: const Text(
    //       'T-Shirt World',
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         letterSpacing: 2.5,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   drawer: Drawer(
    //     child: ListView(
    //       padding: const EdgeInsets.symmetric(vertical: 50),
    //       children: [
    //         Icon(
    //           Icons.account_circle,
    //           size: 150,
    //           color: Colors.grey[700],
    //         ),
    //         const SizedBox(
    //           height: 15,
    //         ),
    //         Text(
    //           userName,
    //           textAlign: TextAlign.center,
    //           style: const TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         const Divider(
    //           height: 2,
    //         ),
    //         ListTile(
    //           onTap: () {},
    //           selected: true,
    //           selectedColor: Theme.of(context).primaryColor,
    //           contentPadding:
    //               const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //           leading: const Icon(Icons.group),
    //           title:
    //               const Text("Groups", style: TextStyle(color: Colors.black)),
    //         ),

    //         // ListTile(
    //         //   onTap: () {
    //         //     nextScreenReplace(
    //         //         context,
    //         //         ProfilePage(
    //         //           username: userName,
    //         //           email: email,
    //         //         ));
    //         //   },
    //         //   contentPadding:
    //         //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //         //   leading: const Icon(Icons.person),
    //         //   title:
    //         //       const Text("Profile", style: TextStyle(color: Colors.black)),
    //         // ),

    //         ListTile(
    //           onTap: () async {
    //             showDialog(
    //               //  barrierDismissible: false,
    //                 context: context,
    //                 builder: (context) {
    //                   return AlertDialog(
    //                     title: const Text("Logout"),
    //                     content: const Text("Are you sure you want to logout?"),
    //                     actions: [
    //                       Container(
    //                           child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           backgroundColor: Colors.red,
    //                         ),
    //                         child: const Text('Cancel'),
    //                         onPressed: () {
    //                           Navigator.pop(context);
    //                         },
    //                       )),
    //                       Container(
    //                           child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           backgroundColor: Colors.green,
    //                         ),
    //                         child: const Text('Ok'),
    //                         onPressed: () async {
    //                           await authService.signOut();
    //                           Navigator.of(context).pushAndRemoveUntil(
    //                               MaterialPageRoute(
    //                                   builder: (context) => const LoginPage()),
    //                               (route) => false);
    //                         },
    //                       )),
    //                     ],
    //                   );
    //                 });
    //             // authService.signOut().whenComplete(() {
    //             //   nextScreenReplace(context, const LoginPage());
    //             // });
    //           },
    //           contentPadding:
    //               const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //           leading: const Icon(Icons.exit_to_app),
    //           title:
    //               const Text("Logout", style: TextStyle(color: Colors.black)),
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: Container(),
    // );
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
          // style: TextButton.styleFrom(
          //   padding: EdgeInsets.all(0),
          //   // minimumSize: Size(50, 30),
          //   // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   // alignment: Alignment.centerLeft,
          // ),
          onPressed: () {},
          child: Text(
            trailingName,
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.w500,
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
              //fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
