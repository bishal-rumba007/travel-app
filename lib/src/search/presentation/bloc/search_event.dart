import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Search extends SearchEvent {
  final String query;

  Search({required this.query});

  @override
  List<Object?> get props => [query];
}

class LoadMore extends SearchEvent {
  final String query;

  LoadMore({required this.query});

  @override
  List<Object?> get props => [];
}