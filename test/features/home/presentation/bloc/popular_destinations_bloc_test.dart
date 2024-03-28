


import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';
import 'package:travel_app/src/home/domain/usecases/get_popular_destinations.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_bloc.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_event.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_state.dart';

class MockGetPopularDestinations extends Mock implements GetPopularDestinations {}


void main(){
  late PopularDestinationsBloc bloc;
  late MockGetPopularDestinations mockGetPopularDestinations;


  setUp(() {
    mockGetPopularDestinations = MockGetPopularDestinations();
    bloc = PopularDestinationsBloc(getPopularDestinations: mockGetPopularDestinations);
  });

  group('PopularDestinationBloc', () {
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

      blocTest<PopularDestinationsBloc, PopularDestinationsState>(
      'emits [PopularDestinationsError] when GetPopularDestinations returns a failure',
      build: (){
        when(() => mockGetPopularDestinations(NoParams())).thenAnswer((_) async => const Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchPopularDestinations()),
      expect: () => [const PopularDestinationsError(message: "Could not get Data!!")],
    );

    blocTest<PopularDestinationsBloc, PopularDestinationsState>(
      'emits [PopularDestinationsLoaded] when GetPopularDestinations returns a list of popular destinations',
      build: (){
        when(() => mockGetPopularDestinations(NoParams())).thenAnswer((_) async => Right(popularDestinations));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchPopularDestinations()),
      expect: () => [PopularDestinationsLoaded(popularDestinations: popularDestinations)],
    );
  });
}