// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:travel_app/src/category/domain/entities/destination_category.dart';
// import 'package:travel_app/src/category/domain/usecases/get_destination_category.dart';
// import 'package:travel_app/src/search/domain/entities/search_result.dart';
// import 'package:travel_app/src/search/domain/repositories/search_repository.dart';
// import 'package:travel_app/src/search/domain/usecases/search_destination_usecase.dart';

// class MockSearchDestination extends Mock
//     implements SearchDestinationRepository {}

// void main() {
//   late MockSearchDestination mockSearchDestination;
//   late SearchDestinations searchDestination;

//   setUp(() {
//     mockSearchDestination = MockSearchDestination();
//     searchDestination = SearchDestinations(mockSearchDestination);
//   });

//   final searchResults = [
//     const SearchResult(
//       destinationId: '1',
//       destinationName: 'Bromo Mountain',
//       destinationImageUrl: 'assets/images/image1.png',
      
//     ),
//   ];

//   test('should get list of destination category from repository', () async {
//     when(() => mockSearchDestination.searchDestinations('Mountain'))
//         .thenAnswer((_) async => Right());

//     final result = await searchDestination(NoParams());

//     expect(result, Right(destinationCategories));
//     verify(() => mockSearchDestination.searchDestination()).called(1);
//   });
// }
