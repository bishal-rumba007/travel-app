import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/home/data/datasource/popular_destination_mock_datasource.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';
import 'package:travel_app/src/home/domain/repositories/popular_destination_repository.dart';

class PopularDestinationsRepositoryImpl implements PopularDestinationsRepository {
  final PopularDestinationsMockDataSource mockDataSource;

  PopularDestinationsRepositoryImpl({required this.mockDataSource});

  @override
  Future<Either<Failure, List<PopularDestination>>> getPopularDestinations() async {
    try {
      final popularDestinationModels = await mockDataSource.getPopularDestinations();
      final popularDestinations = popularDestinationModels.map((model) => model).toList();
      return Right(popularDestinations);
    } on ServerException {
      return const Left(ServerFailure());
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}