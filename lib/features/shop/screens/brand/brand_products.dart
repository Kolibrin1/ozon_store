import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/brands/brand_card.dart';
import 'package:ozon_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        title: Text(
          'Nike',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppBrandCard(
                showBorder: true,
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              AppSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
