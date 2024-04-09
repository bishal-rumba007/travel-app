import 'package:flutter/material.dart';
import 'package:travel_app/src/home/presentation/screens/home_screen.dart';
import 'package:travel_app/src/search/presentation/screens/search_destination_screen.dart';

class Routes {
  static const String home = '/';
  static const String search = '/search';
  static const String destinationDetail = '/destinationDetail';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchDestinationScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Invalid Route'),
        ),
        body: const Center(child: Text('Route does not exist')),
      ),
    );
  }
}