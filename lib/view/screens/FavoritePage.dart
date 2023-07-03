import 'package:code/models/favorite_database_model.dart';
import 'package:code/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/get_quotes_controller.dart';
import '../../utills/Helper/DBHelper.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  GetQuotesController getQuotesController = Get.find<GetQuotesController>();

  @override
  void initState() {
    super.initState();
    getAllFavorite = DBHelper.dbHelper.fatchAllFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: (store.read("themeMode") ?? false)
                ? Colors.white
                : Color(0xff212832),
          ),
        ),
        title: Text(
          "Favorite Quotes",
          style: TextStyle(
            fontSize: heigth * 0.03,
            fontWeight: FontWeight.w600,
            color: (store.read("themeMode") ?? false)
                ? Colors.white
                : Color(0xff212832),
          ),
        ),
        backgroundColor: (store.read("themeMode") ?? false)
            ? Color(0xff212832)
            : Colors.white,
        elevation: 0,
      ),
      backgroundColor:
          (store.read("themeMode") ?? false) ? Color(0xff212832) : Colors.white,
      body: FutureBuilder(
        future: getAllFavorite,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<FavoriteDataBaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Favorite/data.png",
                      height: heigth * 0.35,
                    ),
                    Text(
                      "No favourite quotes!",
                      style: GoogleFonts.ysabeau(
                        textStyle: TextStyle(
                          color: (store.read("themeMode") ?? false)
                              ? Colors.white
                              : Color(0xff212832),
                          fontSize: heigth * 0.038,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text(
                    data[i].quotes,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: (store.read("themeMode") ?? false)
                            ? Colors.white
                            : Color(0xff212832),
                        fontWeight: FontWeight.w500,
                        fontSize: heigth * 0.02,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      data[i].author,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: heigth * 0.018,
                        ),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                        DBHelper.dbHelper.updateSecondQuote(favorite: 0, quote: data[i].quotes);
                        DBHelper.dbHelper.deleteFavorite(quote: data[i].quotes);

                        getQuotesController.getQuotesList(allQuotes: DBHelper.dbHelper.fatchAllQuotes(id: data[i].id!));
                        Get.back();
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: (store.read("themeMode") ?? false)
                          ? Colors.white
                          : Color(0xff212832),
                    ),
                  ),
                ),
                separatorBuilder: (context, _) => Divider(),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
