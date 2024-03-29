import 'package:travel_app/src/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  const SearchResultModel(
      {required super.destinationId,
      required super.destinationName,
      required super.destinationImageUrl,
      required super.category,
      required super.price,
      required super.rating});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      destinationId: json['destination_id'],
      destinationName: json['destination_name'],
      rating: json['rating'].toDouble(),
      destinationImageUrl: json['destination_imageUrl'],
      category: json['category'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'destination_id': destinationId,
      'destination_name': destinationName,
      'rating': rating,
      'destination_imageUrl': destinationImageUrl,
      'category': category,
      'price': price,
    };
  }
}
