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
import '../../controllers/theme_controller.dart';
import '../../models/quotes_database_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AtributesController atributesController = Get.put(AtributesController());
  SettingsController settingsController = Get.put(SettingsController());
  ThemeController themeController = Get.put(ThemeController());

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
                                              builder: (_) => (store
                                                          .read("showAuthor") ==
                                                      true)
                                                  ? Text(
                                                      "- ${e.author}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize:
                                                              heigth * 0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
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
                                                        height: heigth * 0.35,
                                                        width: width,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                "😊😊😊",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      heigth *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Divider(),
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
                                                                              () {
                                                                            Clipboard.setData(ClipboardData(text: e.quotes));
                                                                            Fluttertoast.showToast(
                                                                              msg: "Copy",
                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                              textColor: Colors.white,
                                                                              fontSize: 16,
                                                                              backgroundColor: Colors.grey,
                                                                            );
                                                                            Get.back();
                                                                          },
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
                                                                              () {
                                                                            Get.back();
                                                                            settingsController.getPermissionGalleryValue();
                                                                          },
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
                                                                              () async {
                                                                            Get.bottomSheet(
                                                                              elevation: 0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.vertical(
                                                                                  top: Radius.circular(50),
                                                                                ),
                                                                              ),
                                                                              backgroundColor: Colors.white,
                                                                              Container(
                                                                                height: heigth * 0.35,
                                                                                width: width,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(20),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
                                                                                            final tempDir = await getTemporaryDirectory();
                                                                                            final file = await File("${tempDir.path}/${atributesController.atributesModel.image.split("/images")[1].split("/")[2]}").create();
                                                                                            file.writeAsBytesSync(capturedImage as List<int>);
                                                                                            AsyncWallpaper.setWallpaperFromFile(
                                                                                              filePath: file.path,
                                                                                              wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                                                                              toastDetails: ToastDetails.success(),
                                                                                              errorToastDetails: ToastDetails.error(),
                                                                                            );
                                                                                            Fluttertoast.showToast(
                                                                                              msg: "Set As Home Screen Wallpaper",
                                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                                              textColor: Colors.green,
                                                                                              fontSize: 16,
                                                                                              backgroundColor: Colors.grey,
                                                                                            );

                                                                                            Get.back();
                                                                                            Get.back();
                                                                                          }).catchError((onError) {
                                                                                            print(onError);
                                                                                          });
                                                                                        },
                                                                                        child: Text(
                                                                                          "Home screen",
                                                                                          style: GoogleFonts.poppins(
                                                                                            textStyle: TextStyle(
                                                                                              color: Color(0xff212832),
                                                                                              fontSize: heigth * 0.025,
                                                                                              letterSpacing: 1,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: heigth * 0.025,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
                                                                                            final tempDir = await getTemporaryDirectory();
                                                                                            final file = await File("${tempDir.path}/${atributesController.atributesModel.image.split("/images")[1].split("/")[2]}").create();
                                                                                            file.writeAsBytesSync(capturedImage as List<int>);
                                                                                            AsyncWallpaper.setWallpaperFromFile(
                                                                                              filePath: file.path,
                                                                                              wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                                                                                              toastDetails: ToastDetails.success(),
                                                                                              errorToastDetails: ToastDetails.error(),
                                                                                            );
                                                                                            Fluttertoast.showToast(
                                                                                              msg: "Set As Lock Screen Wallpaper",
                                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                                              textColor: Colors.green,
                                                                                              fontSize: 16,
                                                                                              backgroundColor: Colors.grey,
                                                                                            );

                                                                                            Get.back();
                                                                                            Get.back();
                                                                                          }).catchError((onError) {
                                                                                            print(onError);
                                                                                          });
                                                                                        },
                                                                                        child: Text(
                                                                                          "Lock screen",
                                                                                          style: GoogleFonts.poppins(
                                                                                            textStyle: TextStyle(
                                                                                              color: Color(0xff212832) ,
                                                                                              fontSize: heigth * 0.025,
                                                                                              letterSpacing: 1,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: heigth * 0.025,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
                                                                                            final tempDir = await getTemporaryDirectory();
                                                                                            final file = await File("${tempDir.path}/${atributesController.atributesModel.image.split("/images")[1].split("/")[2]}").create();
                                                                                            file.writeAsBytesSync(capturedImage as List<int>);
                                                                                            AsyncWallpaper.setWallpaperFromFile(
                                                                                              filePath: file.path,
                                                                                              wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                                                                                              toastDetails: ToastDetails.success(),
                                                                                              errorToastDetails: ToastDetails.error(),
                                                                                            );
                                                                                            Fluttertoast.showToast(
                                                                                              msg: "Set As Both Screen Wallpaper",
                                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                                              textColor: Colors.green,
                                                                                              fontSize: 16,
                                                                                              backgroundColor: Colors.grey,
                                                                                            );

                                                                                            Get.back();
                                                                                            Get.back();
                                                                                          }).catchError((onError) {
                                                                                            print(onError);
                                                                                          });
                                                                                        },
                                                                                        child: Text(
                                                                                          "Home & Lock screen",
                                                                                          style: GoogleFonts.poppins(
                                                                                            textStyle: TextStyle(
                                                                                              color:  Color(0xff212832),
                                                                                              fontSize: heigth * 0.025,
                                                                                              letterSpacing: 1,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: heigth * 0.025,
                                                                                      ),
                                                                                      Divider(),
                                                                                      SizedBox(
                                                                                        height: heigth * 0.025,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          Get.back();
                                                                                          Get.back();
                                                                                        },
                                                                                        child: Text(
                                                                                          "Cancel",
                                                                                          style: GoogleFonts.poppins(
                                                                                            textStyle: TextStyle(
                                                                                              color: Color(0xff212832),
                                                                                              fontSize: heigth * 0.025,
                                                                                              letterSpacing: 1,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.wallpaper),
                                                                        ),
                                                                        Text(
                                                                          "    Set as\nwallpaper",
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
                                                              ),
                                                              Divider(),
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
