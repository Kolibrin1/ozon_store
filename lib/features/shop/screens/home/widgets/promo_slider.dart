import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ozon_store/common/widgets/shimmers/shimmer_effect_widget.dart';
import 'package:ozon_store/features/shop/controllers/banner_controller.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/app_colors.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) return const AppShimmerEffect(width: double.infinity, height: 210);
        if (controller.banners.isEmpty) return const Center(child: Text("Информация не найдена"));
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map(
                    (banner) => AppRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
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
                  for (int i = 0; i < controller.banners.length; i++)
                    CircularContainer(
                      width: 20,
                      height: 4,
                      backgroundColor: controller.carouselCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
                      margin: EdgeInsets.only(right: i != controller.banners.length - 1 ? 10 : 0),
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
