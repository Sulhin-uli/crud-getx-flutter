import 'dart:convert';

import 'package:crud_getx/app/data/models/product_model.dart';
import 'package:crud_getx/app/data/providers/product_provider.dart';
import 'package:crud_getx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var product = List<Product>.empty().obs;
  // Map<String, dynamic> body;

  @override
  void onInit() {
    // print(getData());
    // print(getData());
    // TODO: implement onInit
    // getData();
    // print("tes");
    super.onInit();
  }

  void dialogError(String msg) {
    Get.defaultDialog(
        title: "Terjadi Kesalahan",
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ));
  }

  Future getData() async {
    return ProductProvider().getProduct().then((response) {
      for (var i = 0; i < response.length; i++) {
        final data = Product(
          id: response[i]["id"],
          name: response[i]["name"],
        );
        product.add(data);
      }
    });
  }

  void add(String name) {
    if (name != '') {
      ProductProvider().postProduct(name).then((response) {
        final data = Product(
          id: response["id"],
          name: response["name"],
        );
        product.add(data);
        Get.back();
      });
    } else {
      dialogError("Semua Input Harus Diisi");
    }
  }

  void delete(int id) {
    ProductProvider()
        .deleteProduct(id)
        .then((_) => product.removeWhere((element) => element.id == id));
  }

  Product findByid(int id) {
    return product.firstWhere((element) => element.id == id);
  }

  void edit(int id, String name) {
    final data = findByid(id);
    ProductProvider().editProduct(id, name).then((_) {
      data.name = name;
      product.refresh();
      Get.back();
    });
  }
}
