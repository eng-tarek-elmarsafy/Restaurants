import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/features/auth/domain/entities/create_user_entity.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> signUpWithEmail(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.signUpWithEmail(
      name,
      email,
      phoneNumber,
      password,
    );

    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.message)),
      (success) async {
        final result = await authRepo.addUser(
          BackendEndpoint.addUser,
          UserEntity(fullName: name, phon: phoneNumber, id: success.id),
        );
        result.fold(
          (failuer) => emit(SignUpFailure(errorMessage: failuer.message)),
          (r) => emit(SignUpSuccess(userEntity: success)),
        );
        // emit(SignUpSuccess(userEntity: success));
      },
    );
  }
}
