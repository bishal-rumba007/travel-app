


import 'package:equatable/equatable.dart';

abstract class DestinationCategoryEvent extends Equatable {
  const DestinationCategoryEvent();
}


class FetchDestinationCategory extends DestinationCategoryEvent {
  @override
  List<Object?> get props => [];
}