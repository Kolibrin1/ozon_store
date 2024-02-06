import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/brands/brand_card.dart';
import 'package:ozon_store/common/widgets/layouts/grid_layout.dart';
import 'package:ozon_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ozon_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/features/shop/screens/brand/brand_products.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: Text(
          'Все Бренды',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppSectionHeading(
                title: 'Бренды',
                showActionButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              AppGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (_, index) => AppBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
