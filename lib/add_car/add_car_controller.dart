import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCarController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  FocusNode nameNode = FocusNode();
  FocusNode modelNode = FocusNode();
  FocusNode descNode = FocusNode();
  final ImagePicker picker = ImagePicker();
  RxString imagePath = ''.obs;

  RxBool fillComplete = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  void checkFillComplete() {
    fillComplete.value = imagePath.value.isNotEmpty &&
        nameController.text.isNotEmpty &&
        modelController.text.isNotEmpty &&
        descController.text.isNotEmpty;
  }

  Future<dynamic> pickImgFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    }
    Get.back();
    return image;
  }

  Future<dynamic> pickImgFromCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path;
    }

    return image;
  }
}
