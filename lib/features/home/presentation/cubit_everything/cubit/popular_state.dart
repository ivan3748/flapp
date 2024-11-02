part of 'popular_cubit.dart';

abstract class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  final GetEverythingResponseModel model;

  PopularSuccess({required this.model});
}

final class PopularError extends PopularState {
  final String errorMessage;

  PopularError({required this.errorMessage});
}
