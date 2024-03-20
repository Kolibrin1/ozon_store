import 'package:get/get.dart';
import 'package:ozon_store/features/authentication/screens/login/login.dart';
import 'package:ozon_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ozon_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ozon_store/features/authentication/screens/signup/signup.dart';
import 'package:ozon_store/features/authentication/screens/signup/verify_email.dart';
import 'package:ozon_store/features/personalization/screens/address/address.dart';
import 'package:ozon_store/features/personalization/screens/profile/profile.dart';
import 'package:ozon_store/features/personalization/screens/settings/settings.dart';
import 'package:ozon_store/features/shop/screens/cart/cart.dart';
import 'package:ozon_store/features/shop/screens/checkout/checkout.dart';
import 'package:ozon_store/features/shop/screens/home/home.dart';
import 'package:ozon_store/features/shop/screens/order/order.dart';
import 'package:ozon_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ozon_store/features/shop/screens/store/store.dart';
import 'package:ozon_store/features/shop/screens/wishlist/wishlist.dart';

import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RoutesStrings.home, page: () => const HomeScreen()),
    GetPage(name: RoutesStrings.store, page: () => const StoreScreen()),
    GetPage(name: RoutesStrings.favourites, page: () => const FavouriteScreen()),
    GetPage(name: RoutesStrings.settings, page: () => const SettingsScreen()),
    GetPage(name: RoutesStrings.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: RoutesStrings.order, page: () => const OrderScreen()),
    GetPage(name: RoutesStrings.checkout, page: () => const CheckoutScreen()),
    GetPage(name: RoutesStrings.cart, page: () => const CartScreen()),
    GetPage(name: RoutesStrings.userProfile, page: () => const ProfileScreen()),
    GetPage(name: RoutesStrings.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: RoutesStrings.signup, page: () => const SignupScreen()),
    GetPage(name: RoutesStrings.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: RoutesStrings.signIn, page: () => const LoginScreen()),
    GetPage(name: RoutesStrings.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: RoutesStrings.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
