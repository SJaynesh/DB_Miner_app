import 'dart:convert';

import 'package:code/models/local_json_model.dart';
import 'package:code/models/quotes_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalJsonController extends GetxController {
  LocalJsonModel localJsonModel = LocalJsonModel(jsonData: "", Quotes: []);

  LocalJsonDataLoad() async {
    String JsonPath = "assets/json/qoutes.json";
    localJsonModel.jsonData = await rootBundle.loadString(JsonPath);

    List decodedList = jsonDecode(localJsonModel.jsonData);

    localJsonModel.Quotes =
        decodedList.map((e) => QuotesModel.fromJson(e)).toList();

    update();
  }
}
