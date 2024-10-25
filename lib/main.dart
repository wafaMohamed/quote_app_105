import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/quote/service/quote_service.dart';
import 'feature/quote/view/qoute_screen.dart';
import 'feature/quote/view_model/qoute_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => QuoteProvider(quoteService: QuoteService()),
        child: const QuoteScreen(),
      ),
    );
  }
}
