import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';
import 'package:travel_app/src/search/domain/repositories/search_repository.dart';
import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';


class MockSearchDestinationUseCase extends Mock implements SearchDestinationRepository {}


void main() {
  late SearchDestinations searchDestination;
  late MockSearchDestinationUseCase searchRepository;


  setUp(() {
    searchRepository = MockSearchDestinationUseCase();
    searchDestination = SearchDestinations(searchRepository);
  });

  group('Search Destination Use Case', () {
    final searchResults = [
      const SearchResult(
        destinationId: '1',
        destinationName: 'Monument to Salavat Yulaev',
        rating: 4.3,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        price: 390,
      ),
    ];

    test('should get search destinations from the repository', () async {
      // Arrange
      when(() => searchRepository.searchDestinations('Monument to Salavat Yulaev'))
          .thenAnswer((_) async => Right(searchResults));

      // Act
      final result = await searchDestination.search("Monument to Salavat Yulaev");

      // Assert
      expect(result, Right(searchResults));
      verify(() => searchRepository.searchDestinations('Monument to Salavat Yulaev')).called(1);
    });
  });


}