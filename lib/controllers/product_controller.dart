import 'package:get/get.dart';
import 'package:mySHOP/models/product_model.dart';
import 'package:mySHOP/service/apiServices.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  var categoriesList = [].obs;
  //late RxList productList = [].obs ;

  // late final Future<List<ProductModel>> _futureData;
  // apiCalling() {
  //   _futureData = JsonApi().getJsonData();
  // }

  //  List productList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
    fetchCategoriesProducts();
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

  void fetchCategoriesProducts() async {
    try {
      isLoading(true);
      var productsCategoriesList = await ApiService.fetchCategoriesProducts();

      categoriesList.value = productsCategoriesList;
      // print("data get");
      // print(productList);
      // print(products);
    } finally {
      isLoading(false);
    }
  }


}
