import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/src/home/domain/entities/popular_destination.dart';
import 'package:travel_app/src/home/domain/repositories/popular_destination_repository.dart';

class GetPopularDestinations implements UseCase<List<PopularDestination>, NoParams> {
  final PopularDestinationsRepository repository;

  GetPopularDestinations(this.repository);

  @override
  Future<Either<Failure, List<PopularDestination>>> call(NoParams params) async {
    return await repository.getPopularDestinations();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}