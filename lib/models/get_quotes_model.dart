import 'package:code/models/quotes_database_model.dart';

class GetQuotesMethod {
  Future<List<QuotesDatabaseModel>> getAllQuotes;

  GetQuotesMethod({
    required this.getAllQuotes,
  });
}
