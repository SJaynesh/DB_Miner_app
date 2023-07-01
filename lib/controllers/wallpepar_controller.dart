import 'package:code/models/wallpepar_model.dart';
import 'package:get/get.dart';

class WallpeparController extends GetxController {
  WallpeparModel wallpeparModel = WallpeparModel();

  getIndex({required int index}) {
    wallpeparModel.indexCheck = index;
    update();
  }
}
