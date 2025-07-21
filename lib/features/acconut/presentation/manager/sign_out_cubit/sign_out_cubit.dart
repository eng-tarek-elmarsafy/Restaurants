import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());
  final AuthRepo authRepo;
  Future<void> signOut() async {
    emit(SignOutLoading());

    final result = await authRepo.signOut();
    result.fold((failure) => emit(SignOutFailure(message: failure.message)), (
      success,
    ) {
      Prefs.clear();

      return emit(SignOutSuccess());
    });
  }
}
