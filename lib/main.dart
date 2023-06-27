import 'package:code/view/screens/HomePage.dart';
import 'package:code/view/screens/SplachScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => SplachScreen()),
        GetPage(name: "/HomePage", page: () => HomePage()),
      ],
    ),
  );
}
