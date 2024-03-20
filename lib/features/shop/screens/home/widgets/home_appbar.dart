import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/shimmers/shimmer_effect_widget.dart';
import 'package:ozon_store/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/app_appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../cart/cart.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: AppColors.grey,
                ),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const AppShimmerEffect(
                  width: 160,
                  height: 20,
                );
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: AppColors.white,
                      ),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        AppCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
