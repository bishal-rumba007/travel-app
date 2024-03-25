

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/home/data/datasource/popular_destination_mock_datasource.dart';
import 'package:travel_app/src/home/data/models/popular_destination_model.dart';
import 'package:travel_app/src/home/data/repositories/popular_destination_repository_impl.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';


class MockPopularDestinationsMockDataSource extends Mock
    implements PopularDestinationsMockDataSource {}

void main() {
  late PopularDestinationsRepositoryImpl repository;
  late MockPopularDestinationsMockDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPopularDestinationsMockDataSource();
    repository = PopularDestinationsRepositoryImpl(mockDataSource: mockDataSource);
  });

  group('PopularDestinationsRepositoryImpl', () {
    final popularDestinationModels = [
      const PopularDestinationModel(
        destinationId: '1',
        destinationName: 'Monument to Salavat Yulaev',
        rating: 4.9,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        description: 'Visit the iconic Monument to Salavat Yulaev in Ufa, Russia, and learn about the history of this legendary figure.',
        price: 90,
        insurance: true,
        meal: 'Full Board',
        travelTime: '6 hour',
        guideName: 'Sophie Dubois',
        guideImageUrl: 'https://example.com/guide1.jpg',
      ),
    ];

    test('should return a list of PopularDestination entities', () async {
      // Arrange
      when(() => mockDataSource.getPopularDestinations())
          .thenAnswer((_) async => popularDestinationModels);

      // Act
      final result = await repository.getPopularDestinations();

      // Assert
      expect(result, isA<Right<Failure, List<PopularDestination>>>());
      result.fold(
            (failure) => fail('Should not return failure'),
            (popularDestinations) => expect(popularDestinations, popularDestinationModels),
      );
    });

    test('should return a ServerFailure when a ServerException is thrown', () async {
      // Arrange
      when(() => mockDataSource.getPopularDestinations()).thenThrow(ServerException());

      // Act
      final result = await repository.getPopularDestinations();

      // Assert
      expect(result, isA<Left<Failure, List<PopularDestination>>>());
      result.fold(
            (failure) => expect(failure, isA<ServerFailure>()),
            (popularDestinations) => fail('Should not return popular destinations'),
      );
    });

    test('should return a CacheFailure when a CacheException is thrown', () async {
      // Arrange
      when(() => mockDataSource.getPopularDestinations()).thenThrow(CacheException());

      // Act
      final result = await repository.getPopularDestinations();

      // Assert
      expect(result, isA<Left<Failure, List<PopularDestination>>>());
      result.fold(
            (failure) => expect(failure, isA<CacheFailure>()),
            (popularDestinations) => fail('Should not return popular destinations'),
      );
    });
  });
}