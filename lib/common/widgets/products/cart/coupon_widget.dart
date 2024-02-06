import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/functions.dart';

class AppCouponCode extends StatelessWidget {
  const AppCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AppColors.dark : AppColors.white,
      padding: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.sm, right: AppSizes.sm, left: AppSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Есть промокод? Введи сюда',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? AppColors.white.withOpacity(0.5) : AppColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              onPressed: () {},
              child: const Text('Принять'),
            ),
          ),
        ],
      ),
    );
  }
}