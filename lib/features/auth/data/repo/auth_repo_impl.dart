import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:restaurants/features/auth/data/models/user_model.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({required this.authServices});

  final AuthServices authServices;

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    try {
      final user = await authServices.signUpWithEmail(
        email,
        password,
        phoneNumber,
        name,
      );
      return right(UserModel.fromUser(user));
    } on EmailConfirmationPendingFailure catch (e) {
      return left(EmailConfirmationPendingFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
    String password,
    String email,
  ) async {
    try {
      final user = await authServices.signInWithEmail(email, password);

      return right(UserModel.fromUser(user));
    } on EmailConfirmationPendingFailure catch (e) {
      return left(EmailConfirmationPendingFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
