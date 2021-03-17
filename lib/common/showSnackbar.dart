import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'style.dart' as style;

void showSnackbar(String message) {
  Get.snackbar(null, message,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: style.StyleUi.primaryColor,
      colorText: Color(0xFFFFFFFF),
      duration: Duration(seconds: 2));
}
