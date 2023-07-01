import 'dart:typed_data';
class CategoryDatabaseModel {
  int id;
  String category_name;
  // Uint8List category_image;


  CategoryDatabaseModel({
    required this.id,
    required this.category_name,
    // required this.category_image,
  });

  factory CategoryDatabaseModel.formMap({required Map data}) {
    return CategoryDatabaseModel(
      id: data['id'],
      category_name: data['category_name'],
      // category_image: data['category_image']
    );
  }
}
