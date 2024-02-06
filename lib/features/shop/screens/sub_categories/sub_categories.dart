import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/images/rounded_image.dart';
import 'package:ozon_store/common/widgets/products/product_cards/product_car_horizontal.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: Text(
          'Спортивные кроссовки',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppRoundedImage(
                imageUrl: AppImages.promoBanner4,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  AppSectionHeading(
                    title: 'Спортивные футболки',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const AppProductCardHorizontal(),
                      separatorBuilder: (_, __) => const SizedBox(width: AppSizes.spaceBtwItems),
                      itemCount: 4,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
