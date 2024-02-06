import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/appbar/app_appbar.dart';
import 'package:ozon_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ozon_store/common/widgets/texts/section_heading.dart';
import 'package:ozon_store/features/personalization/screens/address/address.dart';
import 'package:ozon_store/features/personalization/screens/profile/profile.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../shop/screens/order/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  AppAppBar(
                    title: Text(
                      'Аккаунт',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
                    ),
                  ),
                  AppUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const AppSectionHeading(
                    title: 'Настройки аккаунта',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Мои адреса',
                    subTitle: 'Установите адрес доставки',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Мои покупки',
                    subTitle: 'Добавить, удалить товары и перейти к оформлению заказа',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Мои заказы',
                    subTitle: 'Незавершенные и завершенные заказы',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Счет',
                    subTitle: 'Управление балансом и регистрация банковского аккаунта',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'Мои купоны',
                    subTitle: 'Список дисконтных купонов',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Уведомления',
                    subTitle: 'Установите любой вид уведомлений',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Настройки приватности',
                    subTitle: 'Управление данными ипользуемого и подключенного аккаунта',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSectionHeading(
                    title: 'Настройки приложения',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Загрузка данных',
                    subTitle: 'Загрузка данных из вашего хранилища Firebase',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Геолокация',
                    subTitle: 'Установка рекоммендуемого местоположения',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Безопасный режим',
                    subTitle: 'Результаты поиска безопасны для всех возрастов',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'HD качество изображений',
                    subTitle: 'Установитиь качество изображения, которое будет видно',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
