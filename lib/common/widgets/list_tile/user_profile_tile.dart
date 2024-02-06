import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ozon_store/common/widgets/images/circular_image.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppCircularImage(
        image: AppImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text(
        '${AppTexts.homeAppbarSubTitle}',
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
      ),
      subtitle: Text(
        'kolibrin.georgiy@mail.ru',
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: AppColors.white),
      ),
    );
  }
}
