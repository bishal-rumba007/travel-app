



import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travel_app/src/category/data/model/destination_category_model.dart';

abstract class DestinationCategoryMockDataSource {
  Future<List<DestinationCategoryModel>> getDestinationCategories();
}

class DestinationCategoryMockDataSourceImpl implements DestinationCategoryMockDataSource {
  @override
  Future<List<DestinationCategoryModel>> getDestinationCategories() async {
    final jsonData = await rootBundle.loadString('assets/json/destination_categories.json');
    final popularDestinationsJson = json.decode(jsonData) as List<dynamic>;


    final destinationCategories = popularDestinationsJson
        .map((json) => DestinationCategoryModel.fromJson(json))
        .toList();

    return destinationCategories;

  }
}