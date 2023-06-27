import 'dart:async';

import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.offNamed("/HomePage");
    });
    return Scaffold(
      body: Container(
        height: heigth,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/SplachScreen/splach.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
