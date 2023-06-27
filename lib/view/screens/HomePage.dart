import 'dart:math';

import 'package:code/controllers/local_json_controller.dart';
import 'package:code/models/quotes_model.dart';
import 'package:code/utills/Helper/DBHelper.dart';
import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalJsonController localjsoncontroller = Get.put(LocalJsonController());

  LoadData() async {
    await localjsoncontroller.LocalJsonDataLoad();
  }

  @override
  void initState() {
    super.initState();
    LoadData();

    localjsoncontroller.localJsonModel.Quotes
        .map((e) => DBHelper.dbHelper.insertCategory(data: e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fatchAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          }else if(snapshot.hasData) {
            List<QuotesModel>? data = snapshot.data;

            
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
