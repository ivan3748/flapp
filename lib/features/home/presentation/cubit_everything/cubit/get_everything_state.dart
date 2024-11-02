part of 'get_everything_cubit.dart';

abstract class GetEverythingState {}

final class GetEverythingInitial extends GetEverythingState {}

class GetEverythingLoading extends GetEverythingState {}

class GetEverythingSuccess extends GetEverythingState {
  final GetEverythingResponseModel model;

  GetEverythingSuccess({required this.model});
}

class GetEverythingError extends GetEverythingState {
  final String errorMessage;

  GetEverythingError({required this.errorMessage});
}