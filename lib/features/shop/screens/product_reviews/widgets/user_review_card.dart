import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/helpers/functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    AppImages.userProfileImage1,
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwItems,
                ),
                Text(
                  'Иван Ангольдт',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const AppRatingBarIndicator(rating: 3.4),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              '01 Дек. 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          '''Купила мужу новые кроссы, а то ему бедненькому обувать нечего оказывается.
    Стоимость - 1300 рублей.
    Даже не надо быть профи в оригиналах, тут ясное дело, что в дешевом магазине не купить бренд, но вот симпатичную фэйковую копию легко))
    ''',
          trimLines: 2,
          trimExpandedText: ' Скрыть',
          trimCollapsedText: ' Читать далее',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        RoundedContainer(
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rien De Mal Магазин',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Дек. 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  '''Купила мужу новые кроссы, а то ему бедненькому обувать нечего оказывается.
    Стоимость - 1300 рублей.
    Даже не надо быть профи в оригиналах, тут ясное дело, что в дешевом магазине не купить бренд, но вот симпатичную фэйковую копию легко))
    ''',
                  trimLines: 2,
                  trimExpandedText: ' Скрыть',
                  trimCollapsedText: ' Читать далее',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
