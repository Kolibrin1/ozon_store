import 'package:get/get.dart';
import 'package:ozon_store/data/repositories/categories/category_repository.dart';
import 'package:ozon_store/features/shop/models/category_model.dart';
import 'package:ozon_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      AppLoader.errorSnackBar(title: 'Ошибка загрузки категорий. Повторите попытку!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}