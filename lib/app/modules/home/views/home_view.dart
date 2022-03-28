import 'package:crud_getx/app/modules/home/views/item_view.dart';
import 'package:crud_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Product'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.ADD), icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() => controller.product.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.product.length,
                itemBuilder: (context, i) {
                  final data = controller.product[i];
                  return ItemView(data);
                },
              )));
  }
}
