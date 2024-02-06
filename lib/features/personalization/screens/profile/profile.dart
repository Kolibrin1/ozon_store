import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/images/circular_image.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const AppCircularImage(
                      image: AppImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(onPressed: () {}, child: const Text('Установить фото профиля'))
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
                onPressed: () {},
                value: 'Rien De Mal',
                title: 'Имя:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: 'rien_de_mal',
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
                value: '53879',
                title: 'ID:',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onPressed: () {},
                value: 'kolibrin.georgiy@mail.ru',
                title: 'Почта:',
              ),
              ProfileMenu(
                onPressed: () {},
                value: '+7 (900) 290-20-33',
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
                  onPressed: () {},
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
