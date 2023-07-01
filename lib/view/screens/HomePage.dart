import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:code/controllers/atributes_controller.dart';
import 'package:code/utills/Helper/DBHelper.dart';
import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../../controllers/setting_controller.dart';
import '../../controllers/wallpepar_controller.dart';
import '../../models/quotes_database_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AtributesController atributesController = Get.put(AtributesController());
  SettingsController settingsController = Get.put(SettingsController());
  WallpeparController wallpeparController = Get.put(WallpeparController());

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    getAllQuotes = DBHelper.dbHelper.fatchAllQuotes(id: 0);

    atributesController.getCategoryName(
        val: atributesController.atributesModel.categoryName);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AtributesController>(builder: (_) {
          return Screenshot(
            controller: screenshotController,
            child: Container(
              height: heigth,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(atributesController.atributesModel.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: heigth,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        atributesController.atributesModel.categoryName,
                        style: TextStyle(
                          fontSize: heigth * 0.025,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: getAllQuotes,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("ERROR : ${snapshot.error}"),
                              );
                            } else if (snapshot.hasData) {
                              List<QuotesDatabaseModel>? data = snapshot.data;

                              if (data == null || data.isEmpty) {
                                return Center(
                                  child: Text("No Data Available"),
                                );
                              } else {
                                return CarouselSlider(
                                  items: data
                                      .map(
                                        (e) => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${e.quotes}",
                                              style: GoogleFonts.ysabeau(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: heigth * 0.035,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heigth * 0.025,
                                            ),
                                            GetBuilder<SettingsController>(
                                              builder: (_) =>
                                                  (settingsController
                                                              .settingsModel
                                                              .showAuthor ==
                                                          true)
                                                      ? Text(
                                                          "- ${e.author}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: heigth *
                                                                  0.022,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      : Text(""),
                                            ),
                                            SizedBox(
                                              height: heigth * 0.025,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                    size: heigth * 0.045,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.bottomSheet(
                                                      elevation: 0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              50),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      Container(
                                                        height: heigth * 0.3,
                                                        width: width,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
                                                                              final tempDir = await getTemporaryDirectory();
                                                                              final file = await File("${tempDir.path}/${atributesController.atributesModel.image.split("/images")[1].split("/")[2]}").create();
                                                                              file.writeAsBytesSync(capturedImage as List<int>);

                                                                              Share.shareFiles([
                                                                                '${file.path}'
                                                                              ]);
                                                                            }).catchError((onError) {
                                                                              print(onError);
                                                                            });
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.share),
                                                                        ),
                                                                        Text(
                                                                          "Share\nImage",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              Icon(Icons.copy),
                                                                        ),
                                                                        Text(
                                                                          "Copy\nQuote",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              Icon(Icons.download),
                                                                        ),
                                                                        Text(
                                                                          "Save to\nGallery",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              Icon(Icons.wallpaper),
                                                                        ),
                                                                        Text(
                                                                          "Set as\nwallpaper",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.tune,
                                                    color: Colors.white,
                                                    size: heigth * 0.045,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                  options: CarouselOptions(
                                    height: heigth * 0.75,
                                    viewportFraction: 1,
                                    scrollDirection: Axis.vertical,
                                  ),
                                );
                              }
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffc37d04),
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed("/CategoryPage");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: Colors.white,
                                    size: heigth * 0.023,
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: heigth * 0.015,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffc37d04),
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed("/ThemeModePage");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.white,
                                    size: heigth * 0.023,
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    "Themes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: heigth * 0.017),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffc37d04),
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed("/SettingPage");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: heigth * 0.023,
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: heigth * 0.017),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
