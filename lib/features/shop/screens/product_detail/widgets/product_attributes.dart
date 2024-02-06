import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/texts/product_price_text.dart';
import 'package:ozon_store/common/widgets/texts/product_title_text.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const AppSectionHeading(
                    title: 'Вариация',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AppProductTitleText(
                            title: 'Цена : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),
                          const AppProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const AppProductTitleText(
                            title: 'Склад : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),
                          Text(
                            'В наличии',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const AppProductTitleText(
                title: 'Это описание товара и оно имеет максимум 4 строки',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(
              title: 'Цвета',
              showActionButton: false,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                  selected: true,
                  text: 'Зеленый',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Синий',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Желтый',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: true,
                  text: 'Зеленый',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Синий',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Желтый',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: true,
                  text: 'Зеленый',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Синий',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'Желтый',
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(
              title: 'Размер',
              showActionButton: false,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                  selected: true,
                  text: 'EU 40',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'EU 42',
                  onSelected: (value) {},
                ),
                AppChoiceChip(
                  selected: false,
                  text: 'EU 44',
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
