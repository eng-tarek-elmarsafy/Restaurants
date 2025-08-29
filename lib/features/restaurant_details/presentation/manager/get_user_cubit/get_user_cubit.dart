import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/backend_endpoint.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/domain/repo/auth_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.authRepo) : super(GetUserInitial());
  final AuthRepo authRepo;

  Future<void> getUser(String uId) async {
    final result = await authRepo.getUser(BackendEndpoint.addUser, uId);

    result.fold(
      (failure) => emit(GetUserFailure(err: failure.message)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }
}
