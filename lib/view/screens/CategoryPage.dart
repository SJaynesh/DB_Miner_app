import 'package:code/controllers/atributes_controller.dart';
import 'package:code/models/category_database_model.dart';
import 'package:flutter/material.dart';

import '../../utills/Helper/DBHelper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../utills/atributes.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  AtributesController atributesController = Get.find<AtributesController>();

  @override
  void initState() {
    super.initState();
    getAllCategory = DBHelper.dbHelper.fatchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (store.read("themeMode")??false) ? Color(0xff212832) : Colors.white,
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
          "Categories",
          style: TextStyle(
            fontSize: heigth * 0.03,
            fontWeight: FontWeight.w600,
            color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
          ),
        ),
        backgroundColor:
            (store.read("themeMode")??false) ? Color(0xff212832) : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: heigth * 0.038,
              color:
                  (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
            color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
            color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getAllCategory,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: heigth * 0.13,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/AllJsonImage/heart.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: heigth * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tough Times",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * 0.023,
                                color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
                              ),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: heigth * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heigth * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              4,
                              (i) => GestureDetector(
                                onTap: () {
                                  atributesController.getImage(
                                      img: allCategoryImage[data[i + 1].id]);
                                  atributesController.getCategoryId(
                                      val: data[i + 1].id);
                                  atributesController.getCategoryName(
                                      val: data[i + 1].category_name);

                                  getAllQuotes = DBHelper.dbHelper
                                      .fatchAllQuotes(id: data[i + 1].id);
                                  Get.back();
                                  setState(() {});
                                },
                                child: Container(
                                  height: heigth * 0.14,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(CategoryImage[data[i].id]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data[i + 1].category_name,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heigth * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Love & Relationship",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * 0.023,
                                color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
                              ),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: heigth * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heigth * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              4,
                              (i) => GestureDetector(
                                onTap: () {
                                  atributesController.getImage(
                                      img: allCategoryImage[data[i + 5].id]);
                                  atributesController.getCategoryId(
                                      val: data[i + 5].id);
                                  atributesController.getCategoryName(
                                      val: data[i + 5].category_name);

                                  getAllQuotes = DBHelper.dbHelper
                                      .fatchAllQuotes(id: data[i + 5].id);
                                  Get.back();
                                  setState(() {});
                                },
                                child: Container(
                                  height: heigth * 0.14,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          CategoryImage[data[i + 4].id]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data[i + 5].category_name,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heigth * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Entrepreneurship",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * 0.023,
                                color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
                              ),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: heigth * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heigth * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              3,
                              (i) => GestureDetector(
                                onTap: () {
                                  atributesController.getImage(
                                      img: allCategoryImage[data[i + 9].id]);
                                  atributesController.getCategoryId(
                                      val: data[i + 9].id);
                                  atributesController.getCategoryName(
                                      val: data[i + 9].category_name);

                                  getAllQuotes = DBHelper.dbHelper
                                      .fatchAllQuotes(id: data[i + 9].id);
                                  Get.back();
                                  setState(() {});
                                },
                                child: Container(
                                  height: heigth * 0.14,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          CategoryImage[data[i + 8].id]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data[i + 9].category_name,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heigth * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Motivations & Inspirations",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * 0.023,
                                color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
                              ),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: heigth * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heigth * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              4,
                              (i) => GestureDetector(
                                onTap: () {
                                  atributesController.getImage(
                                      img: allCategoryImage[data[i + 12].id]);
                                  atributesController.getCategoryId(
                                      val: data[i + 12].id);
                                  atributesController.getCategoryName(
                                      val: data[i + 12].category_name);

                                  getAllQuotes = DBHelper.dbHelper
                                      .fatchAllQuotes(id: data[i + 12].id);
                                  Get.back();
                                  setState(() {});
                                },
                                child: Container(
                                  height: heigth * 0.14,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          CategoryImage[data[i + 11].id]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data[i + 12].category_name,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heigth * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Others",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * 0.023,
                                color: (store.read("themeMode")??false) ? Colors.white : Color(0xff212832),
                              ),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: heigth * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heigth * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              4,
                              (i) => GestureDetector(
                                onTap: () {
                                  atributesController.getImage(
                                      img: allCategoryImage[data[i + 16].id]);
                                  atributesController.getCategoryId(
                                      val: data[i + 16].id);
                                  atributesController.getCategoryName(
                                      val: data[i + 16].category_name);

                                  getAllQuotes = DBHelper.dbHelper
                                      .fatchAllQuotes(id: data[i + 16].id);
                                  Get.back();
                                  setState(() {});
                                },
                                child: Container(
                                  height: heigth * 0.14,
                                  width: width * 0.5,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          CategoryImage[data[i + 15].id]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          data[i + 16].category_name,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
