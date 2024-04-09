

import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/category/data/datasource/destination_category_mock_datasource.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/repositories/destination_category_repository.dart';

class DestinationCategoryRepositoryImpl implements DestinationCategoryRepository{
  final DestinationCategoryMockDataSource mockDataSource;

  DestinationCategoryRepositoryImpl({required this.mockDataSource});

  @override
  Future<Either<Failure, List<DestinationCategory>>> getDestinationCategory() async{
    try{
      final destinationCategoryModels = await mockDataSource.getDestinationCategories();
      final destinationCategories = destinationCategoryModels.map((model) => model).toList();
      return Right(destinationCategories);
    } on ServerException{
      return const Left(ServerFailure("Server Failure"));
    } on CacheException{
      return const Left(CacheFailure("Cache Failure"));
    }
  }

}