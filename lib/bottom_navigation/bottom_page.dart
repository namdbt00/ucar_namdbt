import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/home/home_page.dart';
import 'package:ucar1/temp/news_page.dart';
import 'package:ucar1/temp/profile_page.dart';

import '../const.dart';
import 'bottom_controller.dart';

class HomeView<T extends GetxController> extends GetView {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewController get controller => Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPop(),
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: _buildBottomNavigationBar(),
          body: _buildPageView(),
          // ),
        ),
      ),
    );
  }

  //Thêm PageStorageKey vào key của page để lưu trạng thái page hiện tại
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.bottomSelectedIndex.value = index;
      },
      children: const <Widget>[
        HomePage(
            // key: PageStorageKey(Routes.routeHome),
            ),
        NewsPage(
            key: PageStorageKey('/news_page'),
            ),
        ProfilePage(
          key: PageStorageKey('/profile_page'),
        ),

      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color(0xFFB4B4B4),
      currentIndex: controller.bottomSelectedIndex.value,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      onTap: (index) => controller.bottomTapped(index),
      items: _buildBottomNavBarItems(),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper),
        label: 'New',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ];
  }
}
