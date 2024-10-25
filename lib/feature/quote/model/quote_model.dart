class QuoteModel {
  final int id;
  final String quoteText;
  final String author;

  const QuoteModel({
    required this.id,
    required this.quoteText,
    required this.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'] as int,
        quoteText: json['quote'] as String,
        author: json['author'] as String);
  }
}
