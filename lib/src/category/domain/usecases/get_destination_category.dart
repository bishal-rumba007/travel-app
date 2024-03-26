

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/repositories/destination_category_repository.dart';

class GetDestinationCategory implements UseCase<List<DestinationCategory>, NoParams>{
  final DestinationCategoryRepository repository;

  GetDestinationCategory(this.repository);

  @override
  Future<Either<Failure, List<DestinationCategory>>> call(NoParams params) async {
    return await repository.getDestinationCategory();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}