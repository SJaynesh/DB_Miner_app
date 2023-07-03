import 'package:code/models/get_quotes_model.dart';
import 'package:get/get.dart';

import '../models/quotes_database_model.dart';

class GetQuotesController extends GetxController {

  GetQuotesMethod getQuotesMethod = GetQuotesMethod(getAllQuotes: Future(() => []));

  getQuotesList({required Future<List<QuotesDatabaseModel>> allQuotes}) {
    getQuotesMethod.getAllQuotes = allQuotes;
    update();
  }
}