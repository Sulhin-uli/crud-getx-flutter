import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  late TextEditingController name;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
