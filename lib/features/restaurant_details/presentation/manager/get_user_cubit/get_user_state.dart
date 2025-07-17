part of 'get_user_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserLoading extends GetUserState {}

final class GetUserFailure extends GetUserState {
  GetUserFailure({required this.err});

  final String err;
}

final class GetUserSuccess extends GetUserState {
  GetUserSuccess({required this.user});

  final UserEntity user;
}
