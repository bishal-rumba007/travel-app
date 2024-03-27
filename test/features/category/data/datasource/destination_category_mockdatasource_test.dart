


import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/category/data/datasource/destination_category_mock_datasource.dart';
import 'package:travel_app/src/category/data/model/destination_category_model.dart';

class MockDestinationCategoryMockDataSource extends Mock
    implements DestinationCategoryMockDataSource {}


void main() {
  late DestinationCategoryMockDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockDestinationCategoryMockDataSource();
  });

  group('DestinationCategoryMockDataSource', (){
    final destinationCategories = [
      const DestinationCategoryModel(
        categoryId: '1',
        categoryName: 'Historical Landmark',
        categoryImageUrl: 'assets/images/image1.png',
      ),
    ];

    test('should return a list of DestinationCategoryModel', () async {
      // Arrange
      when(() => mockDataSource.getDestinationCategories())
          .thenAnswer((_) async => destinationCategories);

      // Act
      final result = await mockDataSource.getDestinationCategories();

      // Assert
      expect(result, equals(destinationCategories));
      verify(() => mockDataSource.getDestinationCategories()).called(1);
    });


  });

}