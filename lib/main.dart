import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucar1/add_car/add_car_page.dart';
import 'package:ucar1/home/home_page.dart';
import 'package:ucar1/list_car/list_car_page.dart';
import 'package:ucar1/temp/news_page.dart';
import 'package:ucar1/temp/profile_page.dart';
import 'package:ucar1/ucar_page.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const UcarPage()),
        GetPage(name: '/list_car', page: () => const ListCar()),
        GetPage(name: '/add_car', page: () => const AddCar()),
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/news_page', page: () => const NewsPage()),
        GetPage(name: '/profile_page', page: () => const ProfilePage()),
      ],
    );
  }
}
