import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/shimmers/shimmer_effect_widget.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({super.key, this.itemCount = 6,});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: AppSizes.spaceBtwItems,),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmerEffect(width: 55, height: 55, radius: 55,),
                SizedBox(height: AppSizes.spaceBtwItems / 2,),
                AppShimmerEffect(width: 55, height: 8,),
              ],
            );
          },
        )
    );
  }
}
