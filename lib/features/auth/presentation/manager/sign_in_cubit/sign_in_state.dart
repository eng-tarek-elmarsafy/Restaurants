part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignUpLoading extends SignInState {}

final class SignUpSuccess extends SignInState {
  SignUpSuccess({required this.userEntity});

  final UserEntity userEntity;
}

final class SignUpFailure extends SignInState {
  SignUpFailure({required this.errorMessage});

  final String errorMessage;
}
