import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_navigation/bottom_page.dart';
import 'list_car/list_car_page.dart';

class UcarPage<T extends GetxController> extends GetView {
  const UcarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            buildButton('List Car', () {
              Get.to(() => const ListCar());
            }),
            const SizedBox(height: 20),
            buildButton('HomePage', () {
              Get.to(() => const HomeView());
            })
          ],
        ).paddingOnly(top: Get.height / 3));
  }

  Widget buildButton(String title, Function function) {
    return SizedBox(
      width: Get.width / 3,
      child: ElevatedButton(
        onPressed: () {
          function.call();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}
