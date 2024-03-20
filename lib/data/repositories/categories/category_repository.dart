import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ozon_store/data/services/firebase_storage_service.dart';
import 'package:ozon_store/features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return list;
    } catch (e) {
      throw 'Ошибка загрузки категорий. Повторите попытку!';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(AppFirebaseStorageService());
      for(var category in categories) {
        final file = await storage.getImageDataFromAsset(category.image);

        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } catch (e) {
      throw 'Не удалось загрузить данные. Повторите попытку!';
    }
  }
}