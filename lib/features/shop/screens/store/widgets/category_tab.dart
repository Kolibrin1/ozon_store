import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/layouts/grid_layout.dart';
import 'package:ozon_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AppBrandShowCase(
                images: [
                  AppImages.productImage3,
                  AppImages.productImage2,
                  AppImages.productImage1,
                ],
              ),
              const AppBrandShowCase(
                images: [
                  AppImages.productImage3,
                  AppImages.productImage2,
                  AppImages.productImage1,
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              AppSectionHeading(
                title: 'Вам может понравиться',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              AppGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => AppProductCardVertical(),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
