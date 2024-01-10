import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mySHOP/controllers/product_controller.dart';
import 'package:mySHOP/service/apiServices.dart';

class SearchPage extends SearchDelegate {
  final ProductController productController = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List>(
        future: ApiService.fetchProducts(query: query),
        //  future: GetBlogRepo.fetchAllBlog(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List? product = snapshot.data;

          return ListView.builder(
            itemCount: product?.length,
            itemBuilder: (context, index) {
              final productItem = product?[index];
              return ProductListCard(
                title: productItem['title'].toString(),
                image: productItem['image'].toString(),
                // author: productItem.createdBy.toString(),
                // date: productItem.createdDate.toString(),
                // onClick: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (_) => BlogDetailsPage(
                //         title: productItem.title.toString(),
                //         image: productItem.image.toString(),
                //         blogDetails: productItem.description.toString(),
                //         author: productItem.createdBy.toString(),
                //         date: productItem.createdDate.toString(),
                //       ),
                //     ),
                //   );
                // },
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
        future: ApiService.fetchProducts(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List? product = snapshot.data;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: product?.length,
              itemBuilder: (context, index) {
                final productItem = product?[index];
                return ProductListCard(
                  title: productItem['title'].toString(),
                  image: productItem['image'].toString(),
                  // author: blogPost.createdBy.toString(),
                  // date: blogPost.createdDate.toString(),
                  // onClick: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (_) => BlogDetailsPage(
                  //         title: blogPost.title.toString(),
                  //         image: blogPost.image.toString(),
                  //         blogDetails: blogPost.description.toString(),
                  //         author: blogPost.createdBy.toString(),
                  //         date: blogPost.createdDate.toString(),
                  //       ),
                  //     ),
                  //   );
                  // },
                );
              },
            ),
          );
        });
  }
}

class ProductListCard extends StatelessWidget {
  final String title;
  final String image;
  // final String author;
  // final String date;
  // final VoidCallback onClick;
  ProductListCard({
    required this.title,
    required this.image,
    // required this.author,
    // required this.date,
    // required this.onClick
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      //onTap: onClick,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    // productController.productList[BestSellingindex]["image"]
                    //     .toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      //  title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Shaiful",
                          //author,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "12-01-2024",
                          // '$date',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
