




import 'package:bloc/bloc.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';
import 'package:travel_app/src/home/domain/usecases/get_popular_destinations.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_event.dart';

class PopularDestinationsBloc extends Bloc<PopularDestinationsEvent, List<PopularDestination>> {
  final GetPopularDestinations getPopularDestinations;

  PopularDestinationsBloc({required this.getPopularDestinations}) : super([]) {
    on<FetchPopularDestinations>(_onFetchPopularDestinations);
  }


  Future<void> _onFetchPopularDestinations(
      FetchPopularDestinations event,
      Emitter<List<PopularDestination>> emit,
      ) async{
    final result = await getPopularDestinations(NoParams());
    result.fold(
          (failure) => emit([]),
          (popularDestinations) => emit(popularDestinations),
    );
  }

}