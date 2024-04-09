import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';
import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';
import 'package:travel_app/src/search/presentation/bloc/search_bloc.dart';
import 'package:travel_app/src/search/presentation/bloc/search_event.dart';
import 'package:travel_app/src/search/presentation/bloc/search_state.dart';

class MockSearchBloc extends Mock implements SearchDestinations {}


void main() {
  late SearchBloc searchBloc;
  late MockSearchBloc mockSearchBloc;

  setUp(() {
    mockSearchBloc = MockSearchBloc();
    searchBloc = SearchBloc(searchDestinations: mockSearchBloc);
  });

  group('SearchBloc', ()
  {
    final searchResults = [
      const SearchResult(
        destinationId: '1',
        destinationName: 'Monument to Salavat Yulaev',
        rating: 4.3,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        price: 390,
      ),
      const SearchResult(
        destinationId: '2',
        destinationName: 'Paris',
        rating: 4.9,
        destinationImageUrl: 'assets/images/image1.png',
        category: 'Historical Landmark',
        price: 900,
      ),
    ];

    blocTest<SearchBloc, SearchState>(
      'emits [SearchState.error] when SearchDestinations returns a failure',
      build: () {
        when(() => mockSearchBloc.search(any())).thenAnswer((_) async => const Left(ServerFailure("Could not get Data!!")));
        return searchBloc;
      },
      act: (bloc) => bloc.add(Search(query: 'Monument to Salavat Yulaev')),
      expect: () => [
        const SearchState.loading(),
        const SearchState.error("Could not get Data!!")
      ],
    );

    blocTest<SearchBloc, SearchState>(
      "emits [SearchState.loaded] when SearchDestinations returns a list of search results",
      build: () {
        when(() => mockSearchBloc.search("Monument to Salavat Yulaev")).thenAnswer((_) async => Right(searchResults));
        return searchBloc;
      },
      act: (bloc) => bloc.add(Search(query: "Monument to Salavat Yulaev")),
      expect: () => [
        const SearchState.loading(),
        SearchState.loaded(searchResults)
      ],
    );

  });

}