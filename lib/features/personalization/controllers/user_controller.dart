import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozon_store/data/repositories/auth/auth_repository.dart';
import 'package:ozon_store/data/repositories/user/user_repository.dart';
import 'package:ozon_store/features/authentication/screens/login/login.dart';
import 'package:ozon_store/features/personalization/models/user_model.dart';
import 'package:ozon_store/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/network_manager.dart';
import 'package:ozon_store/utils/popups/full_screen_loader.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(userCredential.user!.displayName ?? '');

          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            email: userCredential.user!.email ?? '',
            prfilePicture: userCredential.user!.photoURL ?? '',
          );
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      AppLoader.warningSnackBar(title: 'Данные не сохранены', message: 'Что-то пошло не так при сохранении ваших данных. Повторите операцию по сохранению данных вашего профиля');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Удаление аккаунта',
      middleText: 'Вы уверены что хотите удалить аккаунт?',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.lg,
          ),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () async => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Отмена'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Удаление аккаунта', AppImages.verifyIllustration);

      final auth = AuthRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          AppFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          AppFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.warningSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }

  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Подтверждение', AppImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      await AuthRepository.instance.reAuthWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthRepository.instance.deleteAccount();

      AppFullScreenLoader.stopLoading();

      Get.off(() => const LoginScreen());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoader.warningSnackBar(title: 'Что-то пошло не так', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.prfilePicture = imageUrl;
        user.refresh();

        AppLoader.successSnackBar(title: 'Поздравляем!', message: 'Ваши данные успешно обновлены!');
      }
    } catch (e) {
      AppLoader.errorSnackBar(title: 'Что-то пошло не так', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
