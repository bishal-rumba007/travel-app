



import 'package:bloc/bloc.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/usecases/get_destination_category.dart';
import 'package:travel_app/src/category/presentation/bloc/category_destination_event.dart';

class DestinationCategoryBloc extends Bloc<DestinationCategoryEvent, List<DestinationCategory>> {
  final GetDestinationCategory getDestinationCategory;

  DestinationCategoryBloc({required this.getDestinationCategory}) : super([]) {
    on<FetchDestinationCategory>(_onFetchDestinationCategory);
  }

  Future<void> _onFetchDestinationCategory(
      FetchDestinationCategory event,
      Emitter<List<DestinationCategory>> emit,
      ) async{
    final result = await getDestinationCategory(NoParams());
    result.fold(
          (failure) => emit([]),
          (destinationCategories) => emit(destinationCategories),
    );
  }
}