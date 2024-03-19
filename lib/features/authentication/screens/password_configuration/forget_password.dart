import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';
import 'package:ozon_store/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: AppSizes.spaceBtwSections * 2),
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: AppValidator.validateEmail,
                  decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(AppTexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
