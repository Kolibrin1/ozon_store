
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppFirebaseStorageService extends GetxController {
  static AppFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAsset(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Не удалось загрузить изображение: $e';
    }
  }

  Future<String> uploadImageData(String path, Uint8List imageData, String name) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(name);
      await ref.putData(imageData);
      return await ref.getDownloadURL();
    } catch (e) {
      throw 'Что-то пошло не так. Повторите попытку!';
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(image.name);
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } catch (e) {
      throw 'Что-то пошло не так. Повторите попытку!';
    }
  }
}
