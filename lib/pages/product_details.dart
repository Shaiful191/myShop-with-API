
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:t_shirt_world/app_color.dart';
// import 'package:online_bazar/pages/added_product_list.dart';
// import 'package:online_bazar/pages/products_description.dart';

class ProductDetails extends StatefulWidget {
  //var _product;
  ProductDetails(
      //  this._product
      );
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
// addToCart(){
//   addedProduct.add(
//      {'name': widget._product["product-name"],
//     'img': widget._product["product-img"],
//      'price': widget._product["product-price"],}
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection("users-favourite-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").where("name", isEqualTo: widget._product['product-name']).snapshots(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.data == null) {
          //       return Text("");
          //     }
          //     return Padding(
          //         padding: const EdgeInsets.only(right: 8),
          //     );
          //   },
          // ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Container(
                    color: Colors.blueAccent,
                    child: Image.asset("assets/t_shirt_world_logo.jpg"),
                    // Image.network(
                    //   widget._product["product-img"],fit: BoxFit.cover,
                    // ),
                  )),
              // AspectRatio(
              //   aspectRatio: 3.5,
              //   child: CarouselSlider(
              //       items: widget._product['product-img']
              //           .map<Widget>((item) => Padding(
              //         padding: const EdgeInsets.only(left: 3, right: 3),
              //         child: Container(
              //           decoration: BoxDecoration(image: DecorationImage(image: NetworkImage( widget._product['product-img']), fit: BoxFit.fitWidth)),
              //         ),
              //       ))
              //           .toList(),
              //       options: CarouselOptions(
              //           autoPlay: false,
              //           enlargeCenterPage: true,
              //           viewportFraction: 0.8,
              //           enlargeStrategy: CenterPageEnlargeStrategy.height,
              //           onPageChanged: (val, carouselPageChangedReason) {
              //             setState(() {});
              //           })),
              // ),
              Text(
                "Product Name",
                // widget._product['product-name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "550",
                // " ${widget._product['product-price'].toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
                // height: 10.sp,
              ),
              Text(
                "The product price depends on factors like production technique, print placement, product color, size and fulfillment location. You also have to take into account that shipping and taxes are extra.",
                //widget._product['product-description'],
                style: TextStyle(
                  // fontSize: 16.sp,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
                // height: 20.sp,
              ),
              //Divider(),
              SizedBox(
                width: 1,
                height: 56,
                // width: 1.sw,
                // height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    // addToCart();
                  },
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      //fontSize: 18.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    //  backgroundColor: Colors.blueAccent,
                    elevation: 3,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                //height: 10.sp,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
