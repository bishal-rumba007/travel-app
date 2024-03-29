import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';
import 'package:travel_app/src/search/domain/repositories/search_repository.dart';

class SearchDestinations implements UseCase<List<SearchResult>, String> {
  final SearchDestinationRepository repository;

  SearchDestinations(this.repository);

  @override
  Future<Either<Failure, List<SearchResult>>> search(String query) async {
    return await repository.searchDestinations(query);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> search(Params params);
}
