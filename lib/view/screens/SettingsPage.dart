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
          title: Text(
            "Setting",
            style: TextStyle(
              fontSize: heigth * 0.03,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0,
        ),
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
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text(
                      "Theme mode",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: settingsController.settingsModel.themeMode,
                      onChanged: (val) {
                        settingsController.getThemeValue(val: val);

                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "Show Author",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: settingsController.settingsModel.showAuthor,
                      onChanged: (val) {
                        settingsController.getAuthorValue(val: val);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.category_sharp),
                    title: Text(
                      "Show recent categories",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: settingsController.settingsModel.showcategory,
                      onChanged: (val) {
                        settingsController.getCategoryValue(val: val);
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
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      "Enable notifications",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value:
                          settingsController.settingsModel.enableNotifications,
                      onChanged: (val) {
                        settingsController.getNotificationValue(val: val);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_active),
                    title: Text(
                      "Set Reminders",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
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
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text(
                      "Rate Us",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text(
                      "Privacy Policy",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: heigth * 0.0218,
                          fontWeight: FontWeight.w500,
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
