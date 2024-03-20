import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/shimmers/app_category_shimmer.dart';
import 'package:ozon_store/features/shop/controllers/category_controller.dart';
import 'package:ozon_store/features/shop/screens/sub_categories/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(
      () {
        if (controller.isLoading.value) return const AppCategoryShimmer();
        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'Данные не найдены',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
            ),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return AppVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
            itemCount: controller.featuredCategories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
