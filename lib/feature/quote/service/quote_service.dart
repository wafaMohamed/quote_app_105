import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_app/core/constant/api.dart';

import '../model/quote_model.dart';

class QuoteService {
  Future<List<QuoteModel>> getQuote(int page) async {
    final response = await http.get(
        Uri.parse('${ApiEndPoints.baseUrl}?skip=${(page - 1) * 30}&limit=30'));
    // fetch data (200) == success
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> quotes = data['quotes'];
      return quotes.map((quote) => QuoteModel.fromJson(quote)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
