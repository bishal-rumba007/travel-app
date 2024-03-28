



import 'package:equatable/equatable.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';

abstract class PopularDestinationsState extends Equatable{
  const PopularDestinationsState();

  @override
  List<Object> get props => [];
}

class PopularDestinationsInitial extends PopularDestinationsState {}

class PopularDestinationsLoading extends PopularDestinationsState {}

class PopularDestinationsLoaded extends PopularDestinationsState {
  final List<PopularDestination> popularDestinations;

  const PopularDestinationsLoaded({required this.popularDestinations});

  @override
  List<Object> get props => [popularDestinations];
}


class PopularDestinationsError extends PopularDestinationsState {
  final String message;

  const PopularDestinationsError({required this.message});

  @override
  List<Object> get props => [message];
}
