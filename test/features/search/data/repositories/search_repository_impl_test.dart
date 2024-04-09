import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/search/data/datasource/search_destination_datasource.dart';
import 'package:travel_app/src/search/data/models/search_result_model.dart';
import 'package:travel_app/src/search/data/repositories/search_destination_repository_impl.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';

class MockSearchDestinationRepoImpl extends Mock
    implements SearchDestinationDataSource {}

void main() {
  late SearchDestinationRepositoryImpl repositoryImpl;
  late MockSearchDestinationRepoImpl mockSearchDestinationRepoImpl;

  setUp(() {
    mockSearchDestinationRepoImpl = MockSearchDestinationRepoImpl();
    repositoryImpl = SearchDestinationRepositoryImpl(
        dataSource: mockSearchDestinationRepoImpl);
  });

  group('SearchDestinationRepositoryImpl', () {
    final searchResultModel = [
      const SearchResultModel(
        destinationId: '1',
        destinationName: 'Monument to Salavat Yulaev',
        rating: 4.9,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        price: 90,
      ),
    ];

    test('should return a list of search result entities', () async {
      //Arrange
      when(() => mockSearchDestinationRepoImpl.searchDestination())
          .thenAnswer((_) async => searchResultModel);

      //Act
      final result =
          await repositoryImpl.searchDestinations('Monument to Salavat Yulaev');

      //Assert
      expect(result, isA<Right<Failure, List<SearchResult>>>());
    });

    test('Should return ServerFailure when a ServerException is thrown',
        () async {
      //Arrange
      when(() => repositoryImpl.searchDestinations(''))
          .thenThrow(ServerException());

      //Act
      final result =
          await repositoryImpl.searchDestinations('Monument to Salavat Yulaev');

      //Assert
      expect(result, isA<Left<Failure, List<SearchResult>>>());
      result.fold(
        (failure) => expect(failure, const ServerFailure("Server Failure")),
        (destinationCategories) =>
            fail('Should not return destinationCategories'),
      );
    });

    test('Should return ServerFailure when a ServerException is thrown',
        () async {
      //Arrange
      when(() => repositoryImpl.searchDestinations(''))
          .thenThrow(ServerException());

      //Act
      final result =
          await repositoryImpl.searchDestinations('Monument to Salavat Yulaev');

      //Assert
      expect(result, isA<Left<Failure, List<SearchResult>>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (destinationCategories) =>
            fail('Should not return destinationCategories'),
      );
    });
  });
}
