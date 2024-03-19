import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ozon_store/common/widgets/succes_screen/succes_screen.dart';
import 'package:ozon_store/data/repositories/auth/auth_repository.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/text_strings.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
      AppLoader.successSnackBar(title: 'Письмо отправлено', message: 'Пожалуйста, проверьте вашу почту');
    } catch (e) {
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: AppImages.verifyIllustration,
              title: AppTexts.yourAccountCreatedTitle,
              subTitle: AppTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && !currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: AppImages.verifyIllustration,
          title: AppTexts.yourAccountCreatedTitle,
          subTitle: AppTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
