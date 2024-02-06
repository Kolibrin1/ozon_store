import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ozon_store/features/shop/controllers/home_controller.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/app_colors.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map(
                (url) => AppRoundedImage(
                  imageUrl: url,
                ),
              )
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
              }),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: controller.carouselCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
                  margin: EdgeInsets.only(right: i != banners.length - 1 ? 10 : 0),
                ),
            ],
          ),
        )
      ],
    );
  }
}
