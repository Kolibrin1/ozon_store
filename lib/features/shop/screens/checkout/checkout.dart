import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/common/widgets/succes_screen/succes_screen.dart';
import 'package:ozon_store/features/navigation_menu.dart';
import 'package:ozon_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ozon_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ozon_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ozon_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/app_appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          "Обзор заказа",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppCouponCode(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              RoundedContainer(
                padding: const EdgeInsets.all(AppSizes.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    AppBillingAmountSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    AppBillingPaymentSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    AppBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: AppImages.successfulPaymentIcon,
              title: 'Оплата прошла успешно',
              subTitle: 'Ваши товары скоро будут доставлены.',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Оформить заказ \$ 256'),
        ),
      ),
    );
  }
}
