import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/features/shop/screens/sub_categories/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return AppVerticalImageText(
            image: AppImages.sportIcon,
            title: 'Спорт',
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
