import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/acconut/domain/repo/account_repo.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this.accountRepo) : super(UpdateUserDataInitial());

  final AccountRepo accountRepo;

  Future<void> updateUserData(Map<String, dynamic> data) async {
    emit(UpdateUserDataLoading());
    final result = await accountRepo.updateUserData(data);
    result.fold(
      (failure) => emit(UpdateUserDataFailure(err: failure.message)),
      (success) => emit(UpdateUserDataSuccess()),
    );
  }
}
