import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          "Корзина",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Оформить заказ \$ 256'),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: CartItems(),
      ),
    );
  }
}
