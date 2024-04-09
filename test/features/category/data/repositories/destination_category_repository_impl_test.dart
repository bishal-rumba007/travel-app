


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/category/data/datasource/destination_category_mock_datasource.dart';
import 'package:travel_app/src/category/data/model/destination_category_model.dart';
import 'package:travel_app/src/category/data/repositories/destination_category_repository_impl.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';

class MockDestinationCategoryRepositoryImpl extends Mock
    implements DestinationCategoryMockDataSource {}


void main() {
  late DestinationCategoryRepositoryImpl repository;
  late MockDestinationCategoryRepositoryImpl mockDestinationCategoryRepositoryImpl;

  setUp(() {
    mockDestinationCategoryRepositoryImpl = MockDestinationCategoryRepositoryImpl();
    repository = DestinationCategoryRepositoryImpl(mockDataSource: mockDestinationCategoryRepositoryImpl);
  });

  group('DestinationCategoryRepositoryImpl', () {
    final destinationCategoryModel = [
      const DestinationCategoryModel(
        categoryId: '1',
        categoryName: 'Historical Landmark',
        categoryImageUrl: 'assets/images/image1.png',
      ),
    ];

    test('Should return list of destination category entities', () async{
      //Arrange
      when(() => mockDestinationCategoryRepositoryImpl.getDestinationCategories())
          .thenAnswer((_) async => destinationCategoryModel);

      //Act
      final result = await repository.getDestinationCategory();

      //Assert
      expect(result, isA<Right<Failure, List<DestinationCategory>>>());
    });

    test('Should return ServerFailure when a ServerException is thrown', () async{
      //Arrange
      when(() => mockDestinationCategoryRepositoryImpl.getDestinationCategories()).thenThrow(ServerException());

      //Act
      final result = await repository.getDestinationCategory();

      //Assert
      expect(result, isA<Left<Failure, List<DestinationCategory>>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (destinationCategories) => fail('Should not return destinationCategories'),
      );
    });

    test('Should return CacheFailure when a CacheException is thrown', () async{
      //Arrange
      when(() => mockDestinationCategoryRepositoryImpl.getDestinationCategories()).thenThrow(CacheException());

      //Act
      final result = await repository.getDestinationCategory();

      //Assert
      expect(result, isA<Left<Failure, List<DestinationCategory>>>());
      result.fold(
        (failure) => expect(failure, isA<CacheFailure>()),
        (destinationCategories) => fail('Should not return destinationCategories'),
      );
    });
  });
}