import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/login_signup/app_form_divider.dart';
import 'package:ozon_store/common/widgets/login_signup/social_buttons.dart';
import 'package:ozon_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppSignupForm(),
              AppFormDivider(dividerText: AppTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
