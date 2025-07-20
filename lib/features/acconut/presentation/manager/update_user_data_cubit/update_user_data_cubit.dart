import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/services/supabase/upload_file_impl.dart';
import 'package:restaurants/features/acconut/domain/repo/account_repo.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this.accountRepo, this.uploadFile)
    : super(UpdateUserDataInitial());

  final AccountRepo accountRepo;
  final UploadFile uploadFile;

  Future<void> updateUserData(Map<String, dynamic> data) async {
    emit(UpdateUserDataLoading());
    final result = await accountRepo.updateUserData(data);
    result.fold(
      (failure) => emit(UpdateUserDataFailure(err: failure.message)),
      (success) => emit(UpdateUserDataSuccess()),
    );
  }

  Future<void> updateUserAvatar(File file) async {
    emit(UpdateUserDataLoading());
    final result = await uploadFile.uploadFile(
      BackendEndpoint.uploadFile,
      file,
    );
    result.fold(
      (failure) => emit(UpdateUserDataFailure(err: failure.message)),
      (success) async {
        Prefs.setString(kImageProfile, success);
        final result = await accountRepo.updateUserData({
          kImageProfile: success,
        });
        result.fold(
          (failure) => emit(UpdateUserDataFailure(err: failure.message)),
          (success) => emit(UpdateUserDataSuccess()),
        );
      },
    );
  }
}
