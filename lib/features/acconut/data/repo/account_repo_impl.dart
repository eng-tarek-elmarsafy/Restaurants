import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/services/auth_services.dart';
import '../../../../core/services/shared_preferences.dart';
import '../../domain/repo/account_repo.dart';

class AccountRepoImpl extends AccountRepo {
  AccountRepoImpl({required this.authServices});

  final AuthServices authServices;
  @override
  Future<Either<Failure, void>> updateUserData(
    Map<String, dynamic> data,
  ) async {
    try {
      await authServices.updateUserData(data);
      Prefs.setString(data.keys.first, data[data.keys.first]);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
