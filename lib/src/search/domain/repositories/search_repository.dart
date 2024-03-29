




import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';

abstract class SearchDestinationRepository {
  Future<Either<Failure, List<SearchResult>>> searchDestinations(String query);
}