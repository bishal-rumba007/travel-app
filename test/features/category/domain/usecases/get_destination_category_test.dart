


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/repositories/destination_category_repository.dart';
import 'package:travel_app/src/category/domain/usecases/get_destination_category.dart';

class MockGetDestinationCategory extends Mock implements DestinationCategoryRepository {}


void main() {
  late MockGetDestinationCategory mockGetDestinationCategory;
  late GetDestinationCategory getDestinationCategory;

  setUp((){
    mockGetDestinationCategory = MockGetDestinationCategory();
    getDestinationCategory = GetDestinationCategory(mockGetDestinationCategory);
  });

  final destinationCategories = [
    const DestinationCategory(
      categoryId: '1',
      categoryName: 'Historical Landmark',
      categoryImageUrl: 'assets/images/image1.png',
    ),
  ];

  test('should get list of destination category from repository', () async{
    when(() => mockGetDestinationCategory.getDestinationCategory())
        .thenAnswer((_) async => Right(destinationCategories));

    final result = await getDestinationCategory(NoParams());

    expect(result, Right(destinationCategories));
    verify(() => mockGetDestinationCategory.getDestinationCategory()).called(1);
  });

}