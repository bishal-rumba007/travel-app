


import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/usecases/get_destination_category.dart';
import 'package:travel_app/src/category/presentation/bloc/category_destination_bloc.dart';
import 'package:travel_app/src/category/presentation/bloc/category_destination_event.dart';

class MockDestinationCategory extends Mock implements GetDestinationCategory{}


void main() {
  late DestinationCategoryBloc bloc;
  late MockDestinationCategory mockDestinationCategory;


  setUp((){
    mockDestinationCategory = MockDestinationCategory();
    bloc = DestinationCategoryBloc(getDestinationCategory: mockDestinationCategory);
  });

  group('Destination Category Bloc', (){
    final destinationCategories = [
      const DestinationCategory(
        categoryId: '1',
        categoryName: 'Historical Landmark',
      ),
    ];

    blocTest<DestinationCategoryBloc, List<DestinationCategory>>(
      'emits [] when GetDestinationCategory returns a failure ',
      build: (){
        when(() => mockDestinationCategory.call(NoParams())).thenAnswer((_) async => const Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchDestinationCategory()),
      expect: () => const <List<DestinationCategory>>[[]],
    );

    blocTest<DestinationCategoryBloc, List<DestinationCategory>>(
      'emits [destinationCategory] when GetDestinationCategory returns a list of destination category ',
      build: (){
        when(() => mockDestinationCategory.call(NoParams())).thenAnswer((_) async => Right(destinationCategories));
        return bloc;
      },

      act: (bloc) => bloc.add(FetchDestinationCategory()),
      expect: () => [destinationCategories]
    );

  });
}