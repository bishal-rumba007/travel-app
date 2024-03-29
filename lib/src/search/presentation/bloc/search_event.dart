


import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SearchDestination extends SearchEvent{
  final String query;

  SearchDestination({required this.query});

  @override
  List<Object?> get props => [query];
}

class SearchDestinationByCategory extends SearchEvent{
  final String category;

  SearchDestinationByCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class SearchDestinationByPrice extends SearchEvent{
  final double price;

  SearchDestinationByPrice({required this.price});

  @override
  List<Object?> get props => [price];
}

class LoadMoreResults extends SearchEvent {
  LoadMoreResults();

  @override
  List<Object?> get props => [];
}