import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'add_car_controller.dart';

class AddCar<T extends GetxController> extends GetView {
  const AddCar({Key? key}) : super(key: key);

  @override
  AddCarController get controller => Get.put(AddCarController());

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addObserver(this);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title:
            const Text('Add Car Brand', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        // automaticallyImplyLeading: false,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 1, color: Colors.black),
              Expanded(child: buildContent()),
              const Divider(height: 1, color: Color(0xFF575757)),
              btnCreate()
            ],
          )),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [brandLogo(), brandDetail()],
      ),
    );
  }

  Widget brandLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Brand Logo',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        pickImage(),
        editText()
      ],
    ).marginAll(12);
  }

  Widget pickImage() {
    return GestureDetector(
        onTap: () {
          showImagePickerBottomSheet();
        },
        child: DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            borderType: BorderType.Circle,
            child: Obx(() => Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xFFE3E3E3)),
                  child: buildImage(),
                )))).marginSymmetric(vertical: 20);
  }

  Widget buildImage() {
    return controller.imagePath.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child:
                Image.file(File(controller.imagePath.value), fit: BoxFit.fill))
        : const Icon(Icons.add);
  }

  Widget editText() {
    return Obx(() => Visibility(
        visible: controller.imagePath.value.isNotEmpty,
        child: const Text(
          'Edit logo',
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
        )).marginOnly(left: 12, bottom: 8));
  }

  Widget brandDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Brand Details',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        textFormField(
            'Brand Name', controller.nameController, controller.nameNode),
        textFormField(
            'Total Models', controller.modelController, controller.modelNode),
        textFormField(
            'Description', controller.descController, controller.descNode)
      ],
    ).marginSymmetric(horizontal: 12);
  }

  Widget textFormField(String label,
      TextEditingController textEditingController, FocusNode node) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: textEditingController,
      focusNode: node,
      // onFieldSubmitted: controller.checkFillComplete(),
      onChanged: (value) {
        controller.checkFillComplete();
      },
    );
  }

  Widget btnCreate() {
    return Obx(() => SizedBox(
        width: Get.width,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: controller.fillComplete.value
                ? const Color(0xFF0F5EDD)
                : const Color(0xFFF1F1F1),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          onPressed: () {
            if (controller.fillComplete.value) {}
          },
          child: Center(
              child: Text(
            'Create Brand',
            style: TextStyle(
                fontSize: 16,
                color: controller.fillComplete.value
                    ? Colors.white
                    : const Color(0xFF8C8C8C)),
          )),
        )).marginAll(12));
  }

  void showImagePickerBottomSheet() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.white,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Image.asset(Const.gallery,
                        width: 25, height: 25, color: Colors.black),
                    title: const Text('Gallery'),
                    onTap: () async {
                      controller.pickImgFromGallery().then((response) {});
                    }),
                ListTile(
                  leading: Image.asset(Const.camera,
                      width: 25, height: 25, color: Colors.black),
                  title: const Text('Camera'),
                  onTap: () async {
                    controller.pickImgFromCamera().then((response) {});
                  },
                ),
              ],
            ),
          );
        });
  }
}
