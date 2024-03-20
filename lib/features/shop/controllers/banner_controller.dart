import 'package:get/get.dart';
import 'package:ozon_store/data/repositories/banners/banner_repository.dart';
import 'package:ozon_store/features/shop/models/banner_model.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  final carouselCurrentIndex = 0.obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.fetchBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      AppLoader.errorSnackBar(title: 'Ошибка загрузки категорий. Повторите попытку!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }


}