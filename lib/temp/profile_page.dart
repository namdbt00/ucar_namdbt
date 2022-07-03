import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage<T extends GetxController> extends GetView {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Profile Page',
      style: TextStyle(fontSize: 24),
    ));
  }
}
