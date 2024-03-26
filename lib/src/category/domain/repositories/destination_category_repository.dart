

import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';

abstract class DestinationCategoryRepository {
  Future<Either<Failure, List<DestinationCategory>>> getDestinationCategory();
}