



import 'package:bloc/bloc.dart';
import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';
import 'package:travel_app/src/search/presentation/bloc/search_event.dart';
import 'package:travel_app/src/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDestinations searchDestinations;
  SearchBloc({required this.searchDestinations}) : super(const SearchState.initial());

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchDestination) {
      yield const SearchState.loading();
      try {
        final searchResult = await searchDestinations.search(event.query);
        yield searchResult.fold(
              (failure) => SearchState.error(failure.toString()),
              (popularDestinations) => SearchState.loaded(popularDestinations),
        );
      } catch (e) {
        yield SearchState.error(e.toString());
      }
    }
  }
}