import 'package:equatable/equatable.dart';

class PopularDestination extends Equatable{
  final String destinationId;
  final String destinationName;
  final double? rating;
  final String? destinationImageUrl;
  final String? category;
  final String? description;
  final double price;
  final bool insurance;
  final String meal;
  final String travelTime;
  final String guideName;
  final String? guideImageUrl;

  const PopularDestination({
    required this.destinationId,
    required this.destinationName,
    this.rating,
    this.destinationImageUrl,
    this.category,
    this.description,
    required this.price,
    required this.insurance,
    required this.meal,
    required this.travelTime,
    required this.guideName,
    this.guideImageUrl,
  });

  @override
  List<Object?> get props => [
    destinationId,
    destinationName,
    rating,
    destinationImageUrl,
    category,
    description,
    price,
    insurance,
    meal,
    travelTime,
    guideName,
    guideImageUrl,
  ];
}
