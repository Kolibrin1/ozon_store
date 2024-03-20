import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/images/circular_image.dart';
import 'package:ozon_store/common/widgets/shimmers/shimmer_effect_widget.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/features/personalization/controllers/user_controller.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import 'widgets/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AppAppBar(
        title: Text('Профиль'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.prfilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : AppImages.user;

                      return controller.imageUploading.value
                          ? const AppShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AppCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Установить фото профиля'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const AppSectionHeading(
                title: 'Информация профиля',
                showActionButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              ProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                value: controller.user.value.fullName,
                title: 'Имя:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: controller.user.value.userName,
                title: 'Username:',
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const AppSectionHeading(
                title: 'Персональная информация',
                showActionButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              ProfileMenu(
                onPressed: () {},
                value: controller.user.value.id,
                title: 'ID:',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onPressed: () {},
                value: controller.user.value.email,
                title: 'Почта:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: controller.user.value.phoneNumber,
                title: 'Телефон:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: 'Мужской',
                title: 'Пол:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: '08 Апреля, 2003',
                title: 'Дата рождения:',
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    controller.deleteAccountWarningPopup();
                  },
                  child: const Text(
                    'Выход из аккаунта',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
