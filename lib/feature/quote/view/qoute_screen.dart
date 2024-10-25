import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/core/theme/app_theme.dart';
import 'package:quote_app/feature/quote/view_model/qoute_provider.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerOfQuote = Provider.of<QuoteProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.greyColor100,
      appBar: AppBar(
        backgroundColor: AppTheme.greyColor100,
        centerTitle: true,
        title: Text(
          'Quote App',
          style: GoogleFonts.alike(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10, // Static count for placeholder quotes
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.accents[index % Colors.accents.length],
                  ),
                  child: Text(
                    'Sample Quote Text', // Placeholder text
                    style: GoogleFonts.alike(
                        color: AppTheme.greyColor900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Author: Sample Author', // Placeholder author
                    style: GoogleFonts.alike(
                        color: AppTheme.greyColor700,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          if(providerOfQuote.isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => providerOfQuote.fetchQuote(),
        tooltip: 'Load More',
        shape: const CircleBorder(),
        backgroundColor: AppTheme.blueColor100,
        child: const Icon(Icons.add),
      ),
    );
  }
}
