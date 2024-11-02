part of 'create_user_cubit.dart';

abstract class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserLoading extends CreateUserState {}

final class CreateUserSuccess extends CreateUserState {}

final class CreateUserError extends CreateUserState {}
