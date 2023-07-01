import 'package:code/models/theme_model.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeModel themeModel = ThemeModel();

  getIndex({required int index}) {
    themeModel.indexCheck = index;
    update();
  }
}
