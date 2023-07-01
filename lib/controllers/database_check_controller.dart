import 'package:code/models/database_check_model.dart';
import 'package:code/utills/atributes.dart';
import 'package:get/get.dart';

class DataBaseCheckController extends GetxController {
  DataBaseCheckModel dataBaseCheckModel = DataBaseCheckModel(isInsert: false);

  InsertInValue()  {
    dataBaseCheckModel.isInsert = true;

    data.write("isInsert", dataBaseCheckModel.isInsert);

    update();
  }
}
