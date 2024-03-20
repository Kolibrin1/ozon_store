import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/features/shop/screens/all_products/all_products.dart';
import 'package:ozon_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ozon_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ozon_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  const AppHomeAppBar(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSearchContainer(
                    text: 'Поиск по Магазину',
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.defaultSpace, bottom: AppSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        AppSectionHeading(
                          title: 'Популярные категории',
                          textColor: AppFunctions.isDarkMode(context) ? AppColors.black : Colors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),
                        const AppHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppPromoSlider(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  AppSectionHeading(
                    title: 'Популярные товары',
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  AppGridLayout(
                    itemCount: 5,
                    itemBuilder: (_, index) => const AppProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
