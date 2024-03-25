

import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';

import '../entities/popular_destination.dart';

abstract class PopularDestinationsRepository {
  Future<Either<Failure, List<PopularDestination>>> getPopularDestinations();
}