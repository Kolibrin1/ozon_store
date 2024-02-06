import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/styles/shadows.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/images/rounded_image.dart';
import 'package:ozon_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ozon_store/common/widgets/texts/product_price_text.dart';
import 'package:ozon_store/common/widgets/texts/product_title_text.dart';
import 'package:ozon_store/features/shop/screens/product_detail/product_detail.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../icons/circular_icon.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.softGrey,
        ),
        child: Row(
          children: [
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: AppRoundedImage(
                      imageUrl: AppImages.productImage1,
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: AppColors.black,
                            ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.sm,
                  top: AppSizes.sm,
                ),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppProductTitleText(
                          title: 'Зеленая Nike Half Sleeves Shirt',
                          smallSize: true,
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwItems / 2,
                        ),
                        AppBrandTitleWithVerifiedIcon(title: 'Nike')
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child: AppProductPriceText(price: '256.0')),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSizes.cardRadiusMd),
                              bottomRight: Radius.circular(AppSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: AppSizes.iconLg * 1.2,
                            height: AppSizes.iconLg * 1.2,
                            child: Icon(
                              Iconsax.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
