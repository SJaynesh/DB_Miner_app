import 'package:code/view/screens/HomePage.dart';
import 'package:code/view/screens/CategoryPage.dart';
import 'package:code/view/screens/SettingsPage.dart';
import 'package:code/view/screens/SplachScreen.dart';
import 'package:code/view/screens/ThemeBackground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      getPages: [
        GetPage(name: "/", page: () => SplachScreen()),
        GetPage(
          name: "/HomePage",
          page: () => HomePage(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: "/CategoryPage",
          page: () => CategoryPage(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: "/SettingPage",
          page: () => SettingsPage(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: "/ThemeModePage",
          page: () => ThemeBackground(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOut,
        ),
      ],
    ),
  );
}
