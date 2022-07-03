import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeViewController extends GetxController {
  final pageController = PageController(initialPage: 0);
  final bottomSelectedIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  // Index: 1 - Màn KTBC, 2 - Màn Thông báo, 3 - Màn thông tin cá nhân
  void bottomTapped(int index) {
    bottomSelectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  DateTime? _currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Do you want to exit app');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
