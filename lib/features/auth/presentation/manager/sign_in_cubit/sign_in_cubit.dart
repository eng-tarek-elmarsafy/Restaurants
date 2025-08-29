import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/create_user_entity.dart';
import '../../../domain/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmail(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmail(password, email);

    result.fold(
      (failure) => emit(SignInFailure(errorMessage: failure.message)),
      (success) => emit(SignInSuccess(userEntity: success)),
    );
  }
}
