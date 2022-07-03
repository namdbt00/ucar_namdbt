import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage<T extends GetxController> extends GetView {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'News Page',
      style: TextStyle(fontSize: 24),
    ));
  }
}
