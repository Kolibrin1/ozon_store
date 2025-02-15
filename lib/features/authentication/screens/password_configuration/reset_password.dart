import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ozon_store/features/authentication/screens/login/login.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              CupertinoIcons.clear,
              color: dark ? AppColors.white : AppColors.dark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(AppImages.deliveredEmailIllustration),
                width: AppFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              /// Title & SubTitle
              Text(
                AppTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                AppTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(AppTexts.done)),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(AppTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
