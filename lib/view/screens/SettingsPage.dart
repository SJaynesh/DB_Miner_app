import 'package:code/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utills/atributes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsController settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
            ),
          ),
          title: Text(
            "Setting",
            style: TextStyle(
              fontSize: heigth * 0.03,
              fontWeight: FontWeight.w600,
              color:
                  (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
            ),
          ),
          elevation: 0,
          backgroundColor:
              (store.read("themeMode")??false) ? Color(0xff212832) : Colors.white,
        ),
        backgroundColor:
            (store.read("themeMode")??false) ? Color(0xff212832) : Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "General",
                    style: TextStyle(
                      fontSize: heigth * 0.02,
                      fontWeight: FontWeight.w500,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.dark_mode,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Theme mode",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: store.read("themeMode") ?? false,
                      onChanged: (val) {
                        settingsController.getThemeValue(val: val);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Show Author",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: store.read("showAuthor") ?? false,
                      onChanged: (val) {
                        settingsController.getAuthorValue(val: val);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.category_sharp,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Show recent categories",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: store.read("showRecentCategory") ?? false,
                      onChanged: (val) {
                        settingsController.getRecentCategoryValue(val: val);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: heigth * 0.02,
                      fontWeight: FontWeight.w500,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Enable notifications",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: store.read("enableNotifications") ?? false,
                      onChanged: (val) {
                        settingsController.getNotificationValue(val: val);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications_active,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Set Reminders",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Support us",
                    style: TextStyle(
                      fontSize: heigth * 0.02,
                      fontWeight: FontWeight.w500,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.star,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Rate Us",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip,
                      color: (store.read("themeMode")??false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                    title: Text(
                      "Privacy Policy",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                          color: (store.read("themeMode")??false)
                              ? Colors.white
                              : Color(0xff212832),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
