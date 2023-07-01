import 'package:code/models/setting_model.dart';
import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsController extends GetxController {
  SettingsModel settingsModel = SettingsModel(
    themeMode: false,
    showAuthor: false,
    showCategory: false,
    enableNotifications: false,
    permissionGallery: false,
  );

  getThemeValue({required bool val}) {
    settingsModel.themeMode = val;

    (store.read("themeMode") ?? false == false)
        ? Get.changeTheme(ThemeData.light(useMaterial3: true))
        : Get.changeTheme(ThemeData.dark(useMaterial3: true));

    store.write("themeMode", settingsModel.themeMode);
    update();
  }

  getAuthorValue({required bool val}) {
    settingsModel.showAuthor = val;

    store.write("showAuthor", settingsModel.showAuthor);
    update();
  }

  getCategoryValue({required bool val}) {
    settingsModel.showCategory = val;

    store.write("showCategory", settingsModel.showCategory);
    update();
  }

  getNotificationValue({required bool val}) {
    settingsModel.enableNotifications = val;

    store.write("enableNotifications", settingsModel.enableNotifications);
    update();
  }

  getPermissionGalleryValue() {
    print(store.read("permissionGallery"));
    (store.read("permissionGallery") == true)
        ?screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {
      final result = await ImageGallerySaver.saveImage(capturedImage!,
          name: "New Image");
      print("${result} File Saved to Gallery");
      Fluttertoast.showToast(
        msg: "Save Gallery",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        fontSize: 16,
        backgroundColor: Colors.grey,
      );
    }).catchError((onError) {
      print(onError);
    })
        :Get.defaultDialog(
      title: "",
      radius: 0,
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.folder_copy_outlined,
              color: Colors.green.shade800,
              size: heigth * 0.035,
            ),
            SizedBox(
              height: heigth * 0.025,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Allow",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: heigth * 0.025,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " MotiVerse",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: heigth * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                    " to access photos, media, and files on your device?",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: heigth * 0.025,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Divider(),
        GestureDetector(
          onTap: () {
            screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              final result = await ImageGallerySaver.saveImage(
                  capturedImage!,
                  name: "New Image");
              print("${result} File Saved to Gallery");
            }).catchError((onError) {
              print(onError);
            });
            Fluttertoast.showToast(
              msg: "Save Gallery",
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.white,
              fontSize: 16,
              backgroundColor: Colors.grey,
            );
            settingsModel.permissionGallery = true;
            Get.back();
          },
          child: Text(
            "Allow",
            style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Deny",
            style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
    print("******************");
    store.write("permissionGallery", settingsModel.permissionGallery);
    update();
  }
}


