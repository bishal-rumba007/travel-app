import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/home/data/datasource/popular_destination_mock_datasource.dart';
import 'package:travel_app/src/home/data/models/popular_destination_model.dart';


class MockPopularDestinationsMockDataSource extends Mock
    implements PopularDestinationsMockDataSource {}

void main() {
  late PopularDestinationsMockDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPopularDestinationsMockDataSource();
  });

  group('PopularDestinationsMockDataSource', () {
    final popularDestinations = [
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
      // Add more popular destinations as needed
    ];

    test('should return a list of PopularDestinationModel', () async {
      // Arrange
      when(() => mockDataSource.getPopularDestinations())
          .thenAnswer((_) async => popularDestinations);

      // Act
      final result = await mockDataSource.getPopularDestinations();

      // Assert
      expect(result, equals(popularDestinations));
      verify(() => mockDataSource.getPopularDestinations()).called(1);
    });
  });
}