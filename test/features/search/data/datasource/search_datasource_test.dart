import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/search/data/datasource/search_destination_datasource.dart';
import 'package:travel_app/src/search/data/models/search_result_model.dart';

class MockSearchDestinationDataSource extends Mock
    implements SearchDestinationDataSource {}

void main() {
  late SearchDestinationDataSource dataSource;

  setUp(() {
    dataSource = MockSearchDestinationDataSource();
  });

  group('SearchDataSource', () {
    final destinations = [
      const SearchResultModel(
        destinationId: '1',
        destinationName: 'Monument to Salavat Yulaev',
        rating: 4.9,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        price: 90,
      ),
    ];
    test('should return a list of destinations when search is called',
        () async {
      // arrange
      when(() => dataSource.searchDestination())
          .thenAnswer((_) async => destinations);

      // act
      final result = await dataSource.searchDestination();

      // assert
      expect(result, destinations);
    });
  });
}
