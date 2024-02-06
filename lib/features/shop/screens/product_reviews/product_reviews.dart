import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/features/shop/screens/product_reviews/widgets/progress_inficator_and_rating.dart';
import 'package:ozon_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ozon_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/device/device_utility.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/app_colors.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: Text('Отзывы и оценки'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Отзывы и оценки подтверждены и отправлены людьми, которые использовали товар, который вы просматривали'),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              AppOverallProductRating(),
              AppRatingBarIndicator(
                rating: 4,
              ),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
