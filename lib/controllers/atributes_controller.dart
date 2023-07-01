import 'package:code/models/atributes_model.dart';
import 'package:get/get.dart';

import '../utills/atributes.dart';

class AtributesController extends GetxController {
  AtributesModel atributesModel = AtributesModel(
      id: 0, categoryName: "Positive Thinking", image: allCategoryImage[0]);

  getImage({required String img}) {
    atributesModel.image = img;
    update();
  }

  getCategoryId({required int val}) {
    atributesModel.id = val;
    update();
  }

  getCategoryName({required String val}) {
    atributesModel.categoryName = val;
    update();
  }
}
