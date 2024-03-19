import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ozon_store/data/repositories/auth/auth_repository.dart';
import 'package:ozon_store/features/personalization/controllers/user_controller.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/helpers/network_manager.dart';
import 'package:ozon_store/utils/popups/full_screen_loader.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Считываем ваши данные...', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      // if (!loginFormKey.currentState!.validate()) {
      //   AppFullScreenLoader.stopLoading();
      //   return;
      // }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      AppFullScreenLoader.stopLoading();
      AuthRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Считываем ваши данные...', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredential);

      AppFullScreenLoader.stopLoading();

      AuthRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }
}
