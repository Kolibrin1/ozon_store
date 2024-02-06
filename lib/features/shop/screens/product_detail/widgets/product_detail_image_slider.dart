import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ozon_store/common/widgets/icons/circular_icon.dart';
import 'package:ozon_store/common/widgets/images/rounded_image.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../../../../utils/constants/image_strings.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return AppCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(
                  AppSizes.productImageRadius * 2,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AppImages.productImage1,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => AppRoundedImage(
                    width: 80,
                    backgroundColor: dark ? AppColors.dark : AppColors.white,
                    border: Border.all(
                      color: AppColors.primary,
                    ),
                    padding: const EdgeInsets.all(AppSizes.sm),
                    imageUrl: AppImages.productImage3,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                  itemCount: 4,
                ),
              ),
            ),
            const AppAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
