import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ozon_store/data/services/firebase_storage_service.dart';
import 'package:ozon_store/features/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Ошибка загрузки баннеров. Повторите попытку!';
    }
  }

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(AppFirebaseStorageService());
      for(var banner in banners) {
        final file = await storage.getImageDataFromAsset(banner.imageUrl);

        final url = await storage.uploadImageData('Banners', file, banner.targetScreen);

        banner.imageUrl = url;

        await _db.collection('Banners').doc(banner.targetScreen).set(banner.toJson());
      }
    } catch (e) {
      throw 'Не удалось загрузить данные. Повторите попытку!';
    }
  }
}