import 'package:code/models/quotes_model.dart';

class LocalJsonModel {
  String jsonData;
  List<QuotesModel> Quotes;

  LocalJsonModel({
    required this.jsonData,
    required this.Quotes,
  });
}
