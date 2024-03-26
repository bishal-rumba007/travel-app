



import 'package:travel_app/src/category/domain/entities/destination_category.dart';

class DestinationCategoryModel extends DestinationCategory{
  const DestinationCategoryModel({
    required super.categoryId,
    required super.categoryName,
    required super.categoryImageUrl,
  });

  factory DestinationCategoryModel.fromJson(Map<String, dynamic> json) {
    return DestinationCategoryModel(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      categoryImageUrl: json['category_imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_imageUrl': categoryImageUrl,
    };
  }
}