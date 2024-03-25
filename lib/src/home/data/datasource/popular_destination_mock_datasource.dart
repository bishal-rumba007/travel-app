import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:travel_app/src/home/data/models/popular_destination_model.dart';

abstract class PopularDestinationsMockDataSource {
  Future<List<PopularDestinationModel>> getPopularDestinations();
}

class PopularDestinationsMockDataSourceImpl implements PopularDestinationsMockDataSource {
  @override
  Future<List<PopularDestinationModel>> getPopularDestinations() async {
    final jsonData = await rootBundle.loadString('assets/json/popular_destinations.json');
    final popularDestinationsJson = json.decode(jsonData) as List<dynamic>;

    final popularDestinations = popularDestinationsJson
        .map((json) => PopularDestinationModel.fromJson(json))
        .toList();

    return popularDestinations;
  }
}