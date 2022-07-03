import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/const.dart';

import '../model/car_brand_model.dart';

class ListCarController extends GetxController {
  List<SliverToBoxAdapter> listCarBrandSliver = [];
  List<CarBrand> listCarBrandSelected = [];

  List<CarBrand> listCarBrandData = [
    CarBrand(logo: Const.honda, name: 'Honda', model: 1200),
    CarBrand(logo: Const.audi, name: 'Audi', model: 1200),
    CarBrand(logo: Const.bmw, name: 'BMW', model: 1200),
    CarBrand(logo: Const.toyota, name: 'Toyota', model: 1200),
    CarBrand(logo: Const.kia, name: 'Kia', model: 1200),
    CarBrand(logo: Const.merc, name: 'Mercedes', model: 1200),
    CarBrand(logo: Const.peugeot, name: 'Peugeot', model: 1200),
    CarBrand(logo: Const.skoda, name: 'Skoda', model: 1200),
    CarBrand(logo: Const.volkswagen, name: 'Volkswagen', model: 1200)
  ];

  @override
  onInit() {
    super.onInit();
    bindData(listCarBrandData);
  }

  void bindData(List<CarBrand> list) {
    for (CarBrand carBrand in list) {
      listCarBrandSliver.add(itemBrand(carBrand));
      if (carBrand != list.last) {
        listCarBrandSliver.add(SliverToBoxAdapter(
            child: const Divider(height: 1, color: Color(0xFFF5F5F5))
                .paddingSymmetric(vertical: 4)));
      }
    }
  }

  SliverToBoxAdapter itemBrand(CarBrand brand) {
    RxBool checked = false.obs;
    return SliverToBoxAdapter(
      child: GestureDetector(
          onTap: () {
            if (listCarBrandSelected.contains(brand)) {
              listCarBrandSelected.remove(brand);
              checked = false.obs;
            } else {
              listCarBrandSelected.add(brand);
              checked = true.obs;
            }
            Get.forceAppUpdate();
          },
          child: ListTile(
              leading: Image.asset(
                brand.logo!,
                height: 48,
                width: 48,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brand.name!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text('${brand.model} models',
                      style: const TextStyle(
                          color: Color(0xFF8C8C8C), fontSize: 12)),
                ],
              ),
              contentPadding: const EdgeInsets.all(0),
              trailing: Obx(() => Image.asset(
                  checked.value ? Const.radioChecked : Const.radioEmpty,
                  width: 21,
                  height: 21)))).paddingSymmetric(horizontal: 12),
    );
  }

  void search(String keyword) {
    List<CarBrand> listSearch = [];

    for (CarBrand carBrand in listCarBrandData) {
      if (carBrand.name!.contains(keyword)) {
        listSearch.add(carBrand);
      }
    }
    listCarBrandSliver.clear();
    bindData(listSearch);
    Get.forceAppUpdate();
  }
}
