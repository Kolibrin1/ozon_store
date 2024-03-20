import 'package:ozon_store/features/shop/models/category_model.dart';
import 'package:ozon_store/utils/constants/image_strings.dart';

class AppDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: AppImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: AppImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: AppImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: AppImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: AppImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: AppImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: AppImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: AppImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

    CategoryModel(id: '8', image: AppImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: AppImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: AppImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),

    CategoryModel(id: '11', image: AppImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: AppImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: AppImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

    CategoryModel(id: '14', image: AppImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: AppImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

    CategoryModel(id: '16', image: AppImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false)
  ];
}
