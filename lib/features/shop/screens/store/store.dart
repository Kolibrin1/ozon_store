import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/appbar/app_tabbar.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ozon_store/common/widgets/layouts/grid_layout.dart';
import 'package:ozon_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/common/widgets/brands/brand_card.dart';
import 'package:ozon_store/features/shop/controllers/category_controller.dart';
import 'package:ozon_store/features/shop/screens/brand/all_brands.dart';
import 'package:ozon_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppAppBar(
          title: Text(
            'Магазин',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [AppCartCounterIcon(onPressed: () {}, iconColor: AppColors.light)],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: AppFunctions.isDarkMode(context) ? AppColors.black : AppColors.white,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    const AppSearchContainer(
                      text: 'Поиск по магазину',
                      showBorder: true,
                      showBackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                    AppSectionHeading(
                      title: 'Популярные бренды',
                      onPressed: () => Get.to(() => const AllBrandsScreen()),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems / 1.5,
                    ),
                    AppGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) => const AppBrandCard(
                        showBorder: true,
                      ),
                    ),
                  ],
                ),
              ),
              bottom: AppTabBar(
                tabs: categories
                    .map(
                      (category) => Tab(
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
          body: TabBarView(
            children: categories
                .map((category) => CategoryTab(
                      category: category,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
