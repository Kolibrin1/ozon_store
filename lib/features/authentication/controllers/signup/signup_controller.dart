import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ozon_store/data/repositories/auth/auth_repository.dart';
import 'package:ozon_store/data/repositories/user/user_repository.dart';
import 'package:ozon_store/features/authentication/screens/signup/verify_email.dart';
import 'package:ozon_store/features/personalization/models/user_model.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/helpers/network_manager.dart';
import 'package:ozon_store/utils/popups/full_screen_loader.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Считываем ваши данные...', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // if (!signupFormKey.currentState!.validate()) return;

      if (!privacyPolicy.value) {
        AppLoader.warningSnackBar(title: 'Примите соглашение', message: 'Согласие на обработку персональных данных');
        return;
      }

      final userCredential = await AuthRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        email: email.text.trim(),
        prfilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      AppLoader.successSnackBar(title: 'Поздравляем!', message: 'Ваш аккаунт успешно создан! Подтвердите почту для продолжения');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }
}
