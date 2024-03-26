




import 'package:equatable/equatable.dart';

class DestinationCategory extends Equatable{
  final String categoryId;
  final String categoryName;
  final String? categoryImageUrl;

  const DestinationCategory({
    required this.categoryId,
    required this.categoryName,
    this.categoryImageUrl,
  });

  @override
  List<Object?> get props => [
    categoryId,
    categoryName,
    categoryImageUrl,
  ];

}