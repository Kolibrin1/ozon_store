import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/functions.dart';

class AppBillingPaymentSection extends StatelessWidget {
  const AppBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeading(
          title: 'Способ оплаты',
          buttonTitle: 'Выбрать',
          onPressed: () {},
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? AppColors.light : AppColors.white,
              padding: EdgeInsets.all(AppSizes.sm),
              child: Image(
                image: const AssetImage(
                  AppImages.paypal,
                ),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems / 2,
            ),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
