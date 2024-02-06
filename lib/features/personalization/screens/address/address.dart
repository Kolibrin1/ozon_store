import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ozon_store/features/personalization/screens/address/add_new_address.dart';
import 'package:ozon_store/features/personalization/screens/address/widgets/single_address.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AppColors.primary,
        child: const Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
      ),
      appBar: AppAppBar(
        title: Text(
          'Адреса',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              AppSingleAddress(
                selectedAddress: true,
              ),
              AppSingleAddress(
                selectedAddress: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
