import 'package:bloc/bloc.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';
import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';
import 'package:travel_app/src/search/presentation/bloc/search_event.dart';
import 'package:travel_app/src/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDestinations searchDestinations;
  List<SearchResult> currentSearchResults = [];

  SearchBloc({required this.searchDestinations}) : super(const SearchState.initial()) {
    on<Search>((event, emit) async {
      emit(const SearchState.loading());
      final result = await searchDestinations.search(event.query);
      result.fold(
            (failure) {
          emit(SearchState.error(failure.message));
        },
            (searchResults) {
          currentSearchResults = searchResults;
          emit(SearchState.loaded(currentSearchResults));
        },
      );
    });

    on<LoadMore>((event, emit) async {
      emit(const SearchState.loading());
      final result = await searchDestinations.search(event.query);
      result.fold(
            (failure) {
          emit(SearchState.error(failure.message));
        },
            (searchResults) {
          currentSearchResults.addAll(searchResults);
          emit(SearchState.loaded(currentSearchResults));
        },
      );
    });
  }
}