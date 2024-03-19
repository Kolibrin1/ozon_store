import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';

class AppLoader {
  static successSnackBar({required  title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse:  true,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      snackPosition: SnackPosition.BOTTOM,
      duration:  Duration(seconds: duration),
      icon: const Icon(Iconsax.check, color: AppColors.white),
    );
  }

  static warningSnackBar({required  title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse:  true,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: AppColors.white),
    );
  }

  static errorSnackBar({required  title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse:  true,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: AppColors.white),
    );
  }
}