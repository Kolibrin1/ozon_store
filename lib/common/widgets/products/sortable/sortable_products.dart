import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/layouts/grid_layout.dart';
import 'package:ozon_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items: ['Имя', 'Высокая цена', 'Низкая цена', 'Распродажа', 'Новинки', 'Популярные'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        AppGridLayout(
          itemCount: 4,
          itemBuilder: (_, index) => const AppProductCardVertical(),
        ),
      ],
    );
  }
}