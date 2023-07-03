import 'package:code/models/favorite_database_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screenshot/screenshot.dart';

import '../models/category_database_model.dart';

double heigth = Get.height;
double width = Get.width;

final store = GetStorage();

Future<List<CategoryDatabaseModel>>? getAllCategory;
Future<List<FavoriteDataBaseModel>>? getAllFavorite;

List<String> allCategoryImage = [
  "assets/images/AllJsonImage/positive.png",
  "assets/images/AllJsonImage/alone.png",
  "assets/images/AllJsonImage/anger.png",
  "assets/images/AllJsonImage/breakup.png",
  "assets/images/AllJsonImage/death.png",
  "assets/images/AllJsonImage/friend.png",
  "assets/images/AllJsonImage/deepLove.png",
  "assets/images/AllJsonImage/divorce.png",
  "assets/images/AllJsonImage/fallingLove.png",
  "assets/images/AllJsonImage/dream.png",
  "assets/images/AllJsonImage/life.png",
  "assets/images/AllJsonImage/determination.png",
  "assets/images/AllJsonImage/motivational.png",
  "assets/images/AllJsonImage/success.png",
  "assets/images/AllJsonImage/inspiration.png",
  "assets/images/AllJsonImage/leadership.png",
  "assets/images/AllJsonImage/anniversary.png",
  "assets/images/AllJsonImage/birthday.png",
  "assets/images/AllJsonImage/happiness.png",
  "assets/images/AllJsonImage/fanny.png",
];


List<String> CategoryImage = [
  "assets/images/CategoryPageImage/alone.png",
  "assets/images/CategoryPageImage/anger.png",
  "assets/images/CategoryPageImage/breakup.png",
  "assets/images/CategoryPageImage/death.png",
  "assets/images/CategoryPageImage/friend.png",
  "assets/images/CategoryPageImage/deepLove.png",
  "assets/images/CategoryPageImage/divorce.png",
  "assets/images/CategoryPageImage/fallingLove.png",
  "assets/images/CategoryPageImage/dream.png",
  "assets/images/CategoryPageImage/life.png",
  "assets/images/CategoryPageImage/determination.png",
  "assets/images/CategoryPageImage/motivational.png",
  "assets/images/CategoryPageImage/success.png",
  "assets/images/CategoryPageImage/inspiration.png",
  "assets/images/CategoryPageImage/leadership.png",
  "assets/images/CategoryPageImage/anniversary.png",
  "assets/images/CategoryPageImage/birthday.png",
  "assets/images/CategoryPageImage/happiness.png",
  "assets/images/CategoryPageImage/fanny.png",
];

List<String> Themes = [
  "assets/images/Themes/1.png",
  "assets/images/Themes/2.png",
  "assets/images/Themes/3.png",
  "assets/images/Themes/4.png",
  "assets/images/Themes/5.png",
  "assets/images/Themes/6.png",
  "assets/images/Themes/7.png",
  "assets/images/Themes/8.png",
  "assets/images/Themes/9.png",
  "assets/images/Themes/10.png",
  "assets/images/Themes/11.png",
  "assets/images/Themes/12.png",
  "assets/images/Themes/13.png",
  "assets/images/Themes/14.png",
  "assets/images/Themes/15.png",
  "assets/images/Themes/16.png",
  "assets/images/Themes/17.png",
  "assets/images/Themes/18.png",
  "assets/images/Themes/19.png",
  "assets/images/Themes/20.png",
  "assets/images/Themes/21.png",
  "assets/images/Themes/22.png",
  "assets/images/Themes/23.png",
  "assets/images/Themes/24.png",
  "assets/images/Themes/25.png",
  "assets/images/Themes/26.png",
  "assets/images/Themes/27.png",
  "assets/images/Themes/28.png",
  "assets/images/Themes/29.png",
  "assets/images/Themes/30.png",
  "assets/images/Themes/31.png",
  "assets/images/Themes/32.png",
  "assets/images/Themes/33.png",
  "assets/images/Themes/34.png",
  "assets/images/Themes/35.png",
  "assets/images/Themes/36.png",
  "assets/images/Themes/37.png",
  "assets/images/Themes/38.png",
  "assets/images/Themes/39.png",
  "assets/images/Themes/40.png",
  "assets/images/Themes/41.png",
  "assets/images/Themes/42.png",
  "assets/images/Themes/43.png",
  "assets/images/Themes/44.png",
  "assets/images/Themes/45.png",
  "assets/images/Themes/46.png",
  "assets/images/Themes/47.png",
  "assets/images/Themes/48.png",
  "assets/images/Themes/49.png",
  "assets/images/Themes/50.png",
  "assets/images/Themes/51.png",
  "assets/images/Themes/52.png",
  "assets/images/Themes/53.png",
  "assets/images/Themes/54.png",
];

ScreenshotController screenshotController = ScreenshotController();
