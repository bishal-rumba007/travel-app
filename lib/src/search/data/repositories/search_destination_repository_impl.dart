import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/search/data/datasource/search_destination_datasource.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';
import 'package:travel_app/src/search/domain/repositories/search_repository.dart';

class SearchDestinationRepositoryImpl implements SearchDestinationRepository{
  final SearchDestinationDataSource dataSource;

  SearchDestinationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<SearchResult>>> searchDestinations(String query) async {
    try {
      final searchResults = await dataSource.searchDestination();
      return Right(searchResults);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}