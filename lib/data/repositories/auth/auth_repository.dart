import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ozon_store/data/repositories/user/user_repository.dart';
import 'package:ozon_store/features/authentication/screens/login/login.dart';
import 'package:ozon_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ozon_store/features/authentication/screens/signup/verify_email.dart';
import 'package:ozon_store/features/navigation_menu.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      !(deviceStorage.read('isFirstTime')) ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<void> reAuthWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.currentUser?.reauthenticateWithCredential(EmailAuthProvider.credential(email: email, password: password));
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';
    }
  }
}
