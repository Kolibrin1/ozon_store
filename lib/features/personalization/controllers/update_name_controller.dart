import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozon_store/data/repositories/user/user_repository.dart';
import 'package:ozon_store/features/personalization/controllers/user_controller.dart';
import 'package:ozon_store/features/personalization/screens/profile/profile.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/helpers/network_manager.dart';
import 'package:ozon_store/utils/popups/full_screen_loader.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Мы обновляем ваши данные', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      AppFullScreenLoader.stopLoading();
      AppLoader.successSnackBar(title: 'Поздравляем!', message: 'Ваши данные успешно обновлены!');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Данные не сохранены', message: 'Что-то пошло не так при сохранении ваших данных. Повторите операцию по сохранению данных вашего профиля');
    }
  }
}
