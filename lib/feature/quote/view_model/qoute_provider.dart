import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/feature/quote/service/quote_service.dart';

import '../model/quote_model.dart';

class QuoteProvider extends ChangeNotifier {
  QuoteProvider({required this.quoteService});

  // attributes
  final QuoteService quoteService;
  final List<QuoteModel> _quotes = [];
   int _currentPage = 1;
   bool _isLoading = false;

  List<QuoteModel> get quotes => _quotes;

  int get currentPage => _currentPage;

  bool get isLoading => _isLoading;

  // function

  Future<void> fetchQuote() async {
    try {
      _isLoading = true;
      notifyListeners();
       final newQuote =  await quoteService.getQuote(_currentPage);
       quotes.addAll(newQuote);
       _currentPage++;
       notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
