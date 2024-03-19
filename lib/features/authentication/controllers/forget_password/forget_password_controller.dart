import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ozon_store/data/repositories/auth/auth_repository.dart';
import 'package:ozon_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/helpers/network_manager.dart';
import 'package:ozon_store/utils/popups/full_screen_loader.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Отправляем письмо...', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      // if(!forgetPasswordFormKey.currentState!.validate()) {
      //   AppFullScreenLoader.stopLoading();
      //   return;
      // }

      await AuthRepository.instance.sendPasswordResetEmail(email.text.trim());

      AppFullScreenLoader.stopLoading();

      AppLoader.successSnackBar(title: 'Письмо отправлено', message: 'Пожалуйста, проверьте ваш почтовый ящик');

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      AppFullScreenLoader.openLoadingDialog('Отправляем письмо...', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      await AuthRepository.instance.sendPasswordResetEmail(email);

      AppFullScreenLoader.stopLoading();

      AppLoader.successSnackBar(title: 'Письмо отправлено', message: 'Пожалуйста, проверьте ваш почтовый ящик');
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }
}