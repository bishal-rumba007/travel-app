



import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:travel_app/src/search/data/models/search_result_model.dart';

abstract class SearchDestinationDataSource{
  Future<List<SearchResultModel>> searchDestination();
}


class SearchDestinationDataSourceImpl implements SearchDestinationDataSource{

  @override
  Future<List<SearchResultModel>> searchDestination() async {
    // Simulating network request
    await Future.delayed(const Duration(seconds: 2));
    final jsonData = await rootBundle.loadString('assets/json/search-data.json');
    final searchDestinationsJson = json.decode(jsonData) as List<dynamic>;
    final searchDestinations = searchDestinationsJson
        .map((json) => SearchResultModel.fromJson(json))
        .toList();

    return searchDestinations;
  }

}