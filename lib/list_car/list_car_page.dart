import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/const.dart';

import '../add_car/add_car_page.dart';
import 'list_car_controller.dart';

class ListCar<T extends GetxController> extends GetView {
  const ListCar({Key? key}) : super(key: key);

  @override
  ListCarController get controller => Get.put(ListCarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Get.theme.iconTheme.copyWith(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => const AddCar());
            },
          ),
          IconButton(
            icon: Image.asset(Const.sort, height: 22, width: 22),
            onPressed: () {},
          )
        ],
        // automaticallyImplyLeading: false,
      ),
      body: Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              titleCar(),
              searchBar(),
              ...controller.listCarBrandSliver
            ],
          )),
    );
  }

  Widget titleCar() {
    return SliverToBoxAdapter(
        child: const Text(
      "Car Brand List",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ).paddingOnly(top: 8, left: 12));
  }

  Widget searchBar() {
    return SliverToBoxAdapter(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xFFF1F1F1)),
      child: TextField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search for car brand'),
        onChanged: (String value) {
          controller.search(value);
        },
      ),
    ).marginAll(12));
  }
}
