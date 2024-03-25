

import 'package:travel_app/src/home/domain/entities/popular_destination.dart';

class PopularDestinationModel extends PopularDestination {
  const PopularDestinationModel({
    required super.destinationId,
    required super.destinationName,
    required super.rating,
    required super.destinationImageUrl,
    required super.category,
    required super.description,
    required super.price,
    required super.insurance,
    required super.meal,
    required super.travelTime,
    required super.guideName,
    required super.guideImageUrl,
  });

  factory PopularDestinationModel.fromJson(Map<String, dynamic> json) {
    return PopularDestinationModel(
      destinationId: json['destination_id'],
      destinationName: json['destination_name'],
      rating: json['rating'].toDouble(),
      destinationImageUrl: json['destination_imageUrl'],
      category: json['category'],
      description: json['description'],
      price: json['price'].toDouble(),
      insurance: json['insurance'],
      meal: json['meal'],
      travelTime: json['travel_time'],
      guideName: json['guide_name'],
      guideImageUrl: json['guide_imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'destination_id': destinationId,
      'destination_name': destinationName,
      'rating': rating,
      'destination_imageUrl': destinationImageUrl,
      'category': category,
      'description': description,
      'price': price,
      'insurance': insurance,
      'meal': meal,
      'travel_time': travelTime,
      'guide_name': guideName,
      'guide_imageUrl': guideImageUrl,
    };
  }
}