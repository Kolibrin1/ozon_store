import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/images/circular_image.dart';
import 'package:ozon_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ozon_store/common/widgets/texts/product_price_text.dart';
import 'package:ozon_store/common/widgets/texts/product_title_text.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/enums.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
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
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            const AppProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        const AppProductTitleText(title: 'Зеленые Nike Sports Shirt'),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const AppProductTitleText(title: 'Статус'),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              'В наличии',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            AppCircularImage(
              image: AppImages.cosmeticsIcon,
              height: 32,
              width: 32,
              overlayColor: dark ? AppColors.white : AppColors.black,
            ),
            const AppBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
