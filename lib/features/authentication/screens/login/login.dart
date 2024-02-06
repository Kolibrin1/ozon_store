import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/styles/spacing_styles.dart';
import 'package:ozon_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ozon_store/common/widgets/login_signup/app_form_divider.dart';
import 'package:ozon_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ozon_store/common/widgets/login_signup/social_buttons.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const AppLoginHeader(),
              const AppLoginForm(),
              AppFormDivider(dividerText: AppTexts.orSignInWith.capitalize!),
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
