import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/search/data/models/search_result_model.dart';
import 'package:travel_app/src/search/domain/repositories/search_repository.dart';
import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';

class MockSearchDestinationUseCase extends Mock
    implements SearchDestinationRepository {}

void main() {
  late MockSearchDestinationUseCase mockSearchDestinationUseCase;
  late SearchDestinations searchDestinationUseCase;

  setUp(() {
    mockSearchDestinationUseCase = MockSearchDestinationUseCase();
    searchDestinationUseCase = SearchDestinations(mockSearchDestinationUseCase);
  });

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
    when(() => mockSearchDestinationUseCase
            .searchDestinations('Monument to Salavat Yulaev'))
        .thenAnswer((_) async => Right(searchResultModel));

    //Act
    final result = await searchDestinationUseCase('Monument to Salavat Yulaev');

    //Assert
    expect(result, isA<Right<Failure, List<SearchResult>>>());
  });
}
