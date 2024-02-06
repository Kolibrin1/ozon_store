import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/products/cart/add_remove_buttons.dart';
import 'package:ozon_store/common/widgets/products/cart/cart_item.dart';
import 'package:ozon_store/common/widgets/texts/product_price_text.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => Column(
        children: [
          const CartItem(),
          if (showAddRemoveButtons)
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    AppProductQuantityWithAddRemoveButtons(),
                  ],
                ),
                AppProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwSections,
      ),
      shrinkWrap: true,
      itemCount: 4,
    );
  }
}
