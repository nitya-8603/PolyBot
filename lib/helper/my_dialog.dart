import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar(
      'info',
      msg,
      backgroundColor: Colors.blue.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  static void success(String msg) {
    Get.snackbar(
      'info',
      msg,
      backgroundColor: Colors.green.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  static void error(String msg) {
    Get.snackbar(
      'info',
      msg,
      backgroundColor: Colors.red.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  static void showLoadingDialog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
