import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:t_shirt_world/models/product_model.dart';
import 'package:t_shirt_world/utils/constants.dart';

class ApiService {

  static Future<List> fetchProducts() async {
    List productList = [];
    try {
      final resposne = await http.get(Uri.parse(Constants.BASE_URL));

      var result = jsonDecode(resposne.body);

      if (resposne.statusCode == 200) {
        productList = result;
       /// print(productList);
        return productList;
      } else {
        return productList;
      }
    } catch (e) {
      return productList;
    }
  }


    static Future<List> fetchCategoriesProducts() async {
    List categoriesList = [];
    try {
      final resposne = await http.get(Uri.parse(Constants.PRODUCTCATEGORIES_BASE_URL));

      var result = jsonDecode(resposne.body);

      if (resposne.statusCode == 200) {
        categoriesList = result;
       /// print(productList);
        return categoriesList;
      } else {
        return categoriesList;
      }
    } catch (e) {
      return categoriesList;
    }
  }


}

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:t_shirt_world/models/product_model.dart';
// import 'package:t_shirt_world/utils/constants.dart';

// class ApiService {
//   static Future<List> fetchProducts() async {
//     List productList = [];
//     try {
//       final resposne = await http.get(Uri.parse(Constants.BASE_URL));

//       var result = jsonDecode(resposne.body);

//       if (resposne.statusCode == 200) {
//         productList = result;
//         return productList;
//       } else {
//         return productList;
//       }
//     } catch (e) {
//       return productList;
//     }
//   }
// }
