import 'package:bloc_demo/app_constants.dart';
import 'package:bloc_demo/Model/product_model.dart';
import 'package:http/http.dart' as http;

import '../Model/product_details.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    var response = await http.get(Uri.parse(AppConstants.url));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Failed To Load Data");
    }
  }

  Future<ProductDetails> getProductDetails(String id) async {
    var response =
        await http.get(Uri.parse(AppConstants.productDetailsUrl + id));
    if (response.statusCode == 200) {
      return productDetailsFromJson(response.body);
    } else {
      throw Exception("Failed To Load Data");
    }
  }
}
