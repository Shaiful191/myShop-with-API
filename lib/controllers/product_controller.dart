import 'package:get/get.dart';
import 'package:t_shirt_world/models/product_model.dart';
import 'package:t_shirt_world/service/apiServices.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  //  List productList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();

      productList.value = products;
      // print("data get");
      // print(productList);
      // print(products);
    } finally {
      isLoading(false);
    }
  }
}
