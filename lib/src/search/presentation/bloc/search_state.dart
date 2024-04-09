
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/src/search/domain/entities/search_result.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(List<SearchResult> results) = _Loaded;
  const factory SearchState.error(String message) = _Error;
}