import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:t_shirt_world/utils/constants.dart';

class ApiService {
  static Future<List> fetchProducts() async {
    List productList = [];
    try {
      final resposne = await http.get(Uri.parse(Constants.BASE_URL));

      var result = jsonDecode(resposne.body);

      if (resposne.statusCode == 200) {
        productList = result;
        return productList;
      } else {
        return productList;
      }
    } catch (e) {
      return productList;
    }
  }
}
