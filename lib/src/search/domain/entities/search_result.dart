


import 'package:equatable/equatable.dart';

class SearchResult extends Equatable{
  final String destinationId;
  final String destinationName;
  final double rating;
  final String destinationImageUrl;
  final String category;
  final double price;

  const SearchResult({
    required this.destinationId,
    required this.destinationName,
    required this.destinationImageUrl,
    required this.category,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    destinationId,
    destinationName,
    destinationImageUrl,
    rating,
    category,
    price,
  ];
}