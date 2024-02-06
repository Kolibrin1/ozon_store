import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class AppOrderListItems extends StatelessWidget {
  const AppOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBtwItems),
      itemBuilder: (_, index) => RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        showBorder: true,
        backgroundColor: dark ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: AppSizes.spaceBtwItems / 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'В процессе',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: AppColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text(
                        '04 Дек. 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: AppSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems / 2,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Заказ',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '№ 24054',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems / 2,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дата доставки',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '23 Дек. 2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
