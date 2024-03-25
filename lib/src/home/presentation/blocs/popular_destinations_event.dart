




import 'package:equatable/equatable.dart';

abstract class PopularDestinationsEvent extends Equatable {
  const PopularDestinationsEvent();
}

class FetchPopularDestinations extends PopularDestinationsEvent {
  @override
  List<Object?> get props => [];
}