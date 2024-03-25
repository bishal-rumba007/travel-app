import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';
import 'package:travel_app/src/home/domain/repositories/popular_destination_repository.dart';
import 'package:travel_app/src/home/domain/usecases/get_popular_destinations.dart';


class MockPopularDestinationsRepository extends Mock
    implements PopularDestinationsRepository {}

void main() {
  late GetPopularDestinations usecase;
  late MockPopularDestinationsRepository mockRepository;

  setUp(() {
    mockRepository = MockPopularDestinationsRepository();
    usecase = GetPopularDestinations(mockRepository);
  });

  final popularDestinations = [
    const PopularDestination(
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

  test('should get popular destinations from the repository', () async {
    // Arrange
    when(() => mockRepository.getPopularDestinations())
        .thenAnswer((_) async => Right(popularDestinations));

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, Right(popularDestinations));
    verify(() => mockRepository.getPopularDestinations()).called(1);
  });
}