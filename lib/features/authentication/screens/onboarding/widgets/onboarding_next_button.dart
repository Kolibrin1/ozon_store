import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);

    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : AppColors.dark,
        ),
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}