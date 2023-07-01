import 'package:code/models/theme_model.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeModel themeModel = ThemeModel();

  getLigthThemeValue({required String val}) {
    themeModel.ligthTheme = val;
    update();
  }

  getDarkThemeValue({required String val}) {
    themeModel.datkTheme = val;
    update();
  }
}
