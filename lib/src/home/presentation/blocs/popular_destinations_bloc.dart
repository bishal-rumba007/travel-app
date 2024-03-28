




import 'package:bloc/bloc.dart';
import 'package:travel_app/src/home/domain/usecases/get_popular_destinations.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_event.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_state.dart';

class PopularDestinationsBloc extends Bloc<PopularDestinationsEvent, PopularDestinationsState> {
  final GetPopularDestinations getPopularDestinations;

  PopularDestinationsBloc({required this.getPopularDestinations}) : super(PopularDestinationsInitial()) {
    on<FetchPopularDestinations>(_onFetchPopularDestinations);
  }


  Future<void> _onFetchPopularDestinations(
      FetchPopularDestinations event,
      Emitter<PopularDestinationsState> emit,
      ) async{
    final result = await getPopularDestinations(NoParams());
    result.fold(
          (failure) => emit(const PopularDestinationsError(message: "Could not get Data!!")),
          (popularDestinations) => emit(PopularDestinationsLoaded(popularDestinations: popularDestinations)),
    );
  }

}