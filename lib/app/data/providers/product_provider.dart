import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String url = "http://192.168.100.92:8001/api/test/";

  Future<dynamic> getProduct() async {
    final response = await get('$url');
    return response.body;
  }

  Future<void> editProduct(int id, String name) async {
    await patch('$url' + '$id', {
      "name": name,
    });
  }

  Future<dynamic> postProduct(String name) async {
    final response = await post('$url', {
      "name": name,
    });
    return response.body;
  }

  Future<void> deleteProduct(int id) async => await delete('$url' + '$id');
}
