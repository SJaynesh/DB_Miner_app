import 'package:code/models/setting_model.dart';
import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  SettingsModel settingsModel = SettingsModel(
    themeMode: false,
    showAuthor: false,
    showCategory: false,
    enableNotifications: false,
    permissionGallery: false,
  );

  getThemeValue({required bool val}) {
    settingsModel.themeMode = val;

    (store.read("themeMode") ?? false == false)
        ? Get.changeTheme(ThemeData.light(useMaterial3: true))
        : Get.changeTheme(ThemeData.dark(useMaterial3: true));

    store.write("themeMode", settingsModel.themeMode);
    update();
  }

  getAuthorValue({required bool val}) {
    settingsModel.showAuthor = val;

    store.write("showAuthor", settingsModel.showAuthor);
    update();
  }

  getCategoryValue({required bool val}) {
    settingsModel.showCategory = val;

    store.write("showCategory", settingsModel.showCategory);
    update();
  }

  getNotificationValue({required bool val}) {
    settingsModel.enableNotifications = val;

    store.write("enableNotifications", settingsModel.enableNotifications);
    update();
  }

  getPermissionGalleryValue() {
    settingsModel.permissionGallery = true;

    store.write("permissionGallery", settingsModel.permissionGallery);
    update();
  }
}
