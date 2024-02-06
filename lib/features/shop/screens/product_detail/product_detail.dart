import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:ozon_store/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:ozon_store/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:ozon_store/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.defaultSpace, left: AppSizes.defaultSpace, bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppRatingAndShare(),
                  const ProductMetaData(),
                  const ProductAttributes(),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Купить'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSectionHeading(
                    title: 'Описание',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'Очень мягкий и облегающий стопу материал верха. Подошва полностью покрыта прочной резиной. Это утяжеляет кроссовки, но значительно добавляет прочности. Модель подойдет для комфортного бега на любые дистанции, регулярных тренировок, начинающим для первого марафона и полумарафона.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Читать далее',
                    trimExpandedText: ' Скрыть',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppSectionHeading(
                        title: 'Отзывы(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
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
