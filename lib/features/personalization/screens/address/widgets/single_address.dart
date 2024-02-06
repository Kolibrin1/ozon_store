import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/functions.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.light
                      : AppColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Иван Ангольдт',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              const Text(
                '+7 (918) 782-54-65',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              const Text(
                '555989 Красноармейская 55/1, Краснодар, Краснодарский край, Россия',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
