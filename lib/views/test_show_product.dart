import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_shirt_world/controllers/product_controller.dart';

class TestShowProducts extends StatelessWidget {
  TestShowProducts({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test show product'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print(productController.productList);

          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                var products = productController.productList[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(products["image"].toString()),
                        SizedBox(
                          height: 3,
                        ),
                        Text(productController.productList[index]["title"]
                            .toString()),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
