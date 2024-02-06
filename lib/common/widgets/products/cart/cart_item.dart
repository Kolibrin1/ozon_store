import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/images/rounded_image.dart';
import 'package:ozon_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ozon_store/common/widgets/texts/product_title_text.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRoundedImage(
          imageUrl: AppImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(
                child: AppProductTitleText(
                  title: 'Черные спортивные кроссовки',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Цвет',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Зеленый',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: 'Размер',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'EK 08',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}