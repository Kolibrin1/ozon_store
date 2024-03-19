import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import 'loader.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: AppFunctions.isDarkMode(Get.context!) ? Colors.black : Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                AppAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        );
      },
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
