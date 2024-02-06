import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/brands/brand_card.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class AppBrandShowCase extends StatelessWidget {
  const AppBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceBtwItems,
      ),
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        children: [
          const AppBrandCard(
            showBorder: false,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Row(
            children: images.map((e) => brandTopProductImageWidget(e, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: AppFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
        margin: const EdgeInsets.only(
          right: AppSizes.sm,
        ),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}
