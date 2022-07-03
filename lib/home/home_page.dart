import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/const.dart';

import 'home_controller.dart';

class HomePage<T extends GetxController> extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageController get controller => Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                buildAppBar(),
                buildAds(),
                baseListBrand('Popular Brands', true),
                baseListBrand('Car Type', false),
                baseListItem('Used Cars', 0),
                baseListItem('New Cars', 1),
                baseListItem('Latest News', 2),
              ],
            )));
  }

  Widget buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      elevation: 1.0,
      pinned: true,
      centerTitle: true,
      toolbarHeight: kToolbarHeight,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Const.logo,
            height: 40,
            width: 120,
          ),
          const Icon(Icons.search)
        ],
      ).paddingSymmetric(vertical: 8, horizontal: 16),
    );
  }

  Widget buildAds() {
    return SliverToBoxAdapter(
        child: Container(
      width: Get.width,
      color: Colors.transparent,
      height: 88,
      child: CarouselSlider(
        items: _buildSlideShow(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: 5.seconds,
        ),
      ),
    ));
  }

  List<Widget>? _buildSlideShow() {
    return List.generate(
      controller.listAds.length,
      (index) {
        return GestureDetector(
          onTap: () => {},
          child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                controller.listAds.elementAt(index),
                fit: BoxFit.fill,
              )),
        );
      },
    );
  }

  Widget baseListBrand(String title, bool isPopularBrands) {
    return SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ).marginAll(16),
        SizedBox(
            height: isPopularBrands ? 160 : 80,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              childAspectRatio: 100 * 4.0 / Get.size.width,
              crossAxisCount: isPopularBrands ? 2 : 1,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              children: controller.listBrand(isPopularBrands),
            ))
      ],
    ));
  }

  Widget baseListItem(String title, int type) {
    return SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_right_alt))
          ],
        ).marginOnly(left: 16),
        SizedBox(
          height: type == 0 ? 180 : type == 1 ? 160 : 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // childAspectRatio: 100 * 4.0 / Get.size.width,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            children: controller.listItem(type),
          ),
        ).marginSymmetric(horizontal: 16)
      ],
    ));
  }
}
