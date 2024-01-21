import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mySHOP/controllers/product_controller.dart';
import 'package:mySHOP/utils/app_color.dart';
import 'package:mySHOP/controllers/bottom_navigation_controller.dart';
import 'package:mySHOP/helper/helper.dart';
import 'package:mySHOP/views/auth/login_page.dart';
import 'package:mySHOP/views/product_details.dart';
import 'package:mySHOP/views/search_page.dart';
import 'package:mySHOP/views/user_profile_page.dart';
import 'package:mySHOP/service/auth_service.dart';
import 'package:mySHOP/componants/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // fetchCarouselImages();
    // fetchProducts();
    productController.productList;
    productController.categoriesList;
    super.initState();
  }

  var categoriesImageList = [12, 7, 2, 14];

  ProductController productController = Get.put(ProductController());
//  late ProductController productController;
//   _loadData() async {
//    productController = await Get.put(ProductController());
//     ;
//   }

  @override
  Widget build(BuildContext context) {
    //_loadData();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder<ProductController>(builder: (product) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              HomePageAppBar(),
              HomePageOfferCard(height: height),
              SizedBox(
                height: height * 0.01,
              ),
              SubHeadline(
                leadingName: "Categories",
                trailingName: "See All",
              ),
              Container(
                height: height * 0.15,
                child: Obx(() {
                  if (productController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    //  return Text( productController.productList[0]["title"].toString());
                    // print(productController.categoriesList[0]);
                    return Expanded(
                      // flex: 1,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.categoriesList.length,
                        //  itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoriesCard(
                            productController: productController,
                            width: width,
                            height: height * 0.15,
                            //  color: colorList[index],
                            //   color: colorList[index],
                            index: index,
                            ImageListindex: categoriesImageList[index],
                            //  categoriesName: "Bread",
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: width * 0.04,
                          );
                        },
                      ),
                    );
                  }
                }),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SubHeadline(
                leadingName: "Best Selling",
                trailingName: "See All",
              ),
              //  Obx(() {
              //       return Text(
              //         controller.counter.toString(),
              //         style: Theme.of(context).textTheme.headlineMedium,
              //       );
              //     }),

              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  //  itemCount: productController.categoriesList.length,
                  itemCount: 7,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return BestSellingCard(
                      height: height,
                      width: width,
                      productController: productController,
                      BestSellingindex: index + 10,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}

// ignore: must_be_immutable
class BestSellingCard extends StatelessWidget {
  BestSellingCard({
    super.key,
    required this.height,
    required this.width,
    required this.productController,
    required this.BestSellingindex,
  });

  final double height;
  final double width;
  final productController;
  int BestSellingindex;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                child: Image.network(
                  productController.productList[BestSellingindex]["image"]
                      .toString(),
                  fit: BoxFit.cover,
                ),

                //  Icon(
                //   Icons.food_bank,
                //   size: 40,
                //   color: AppColors.primary,
                // ),
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
                      productController.productList[BestSellingindex]["title"]
                          .toString(),
                      //     "Orange Fresh Juice",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      productController.productList[BestSellingindex]
                              ["description"]
                          .toString(),
                      // "It dummy reasonable to laying Lorem words to.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "TK." +
                          productController.productList[BestSellingindex]
                                  ["price"]
                              .toString(),
                      // "Tk.550",
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
    });
  }
}

class HomePageOfferCard extends StatelessWidget {
  const HomePageOfferCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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

// ignore: must_be_immutable
class CategoriesCard extends StatelessWidget {
  CategoriesCard({
    super.key,
    required this.width,
    required this.height,
    //required this.color,
    required this.ImageListindex,
    required this.productController,
    required this.index,

    // required this.categoriesName,
  });

  final double width;
  final double height;
  // final Color color;
  final int ImageListindex;
  final int index;
  var productController;

  // final String categoriesName;

  //final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 6.0),
        // height: height * 0.15,
        //alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          //color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        height: height,
        // width: width * 0.20,

        child: Obx(() {
          return Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.60,
                child: Image.network(
                  // productController.productList[7]["image"].toString(),
                  //  productController.productList[14]["image"].toString(),
                  // productController.productList[2]["image"].toString(),
                  // productController.productList[12]["image"].toString(),
                  productController.productList[ImageListindex]["image"]
                      .toString(),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                productController.categoriesList[index].toString(),
                //  productController.categoriesList[index].toString(),
                //  productController.productList[index]["category"].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              // Text(
              //   productController.productList[0]["title"].toString(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          );
        }),
      ),
    );
  }
}
