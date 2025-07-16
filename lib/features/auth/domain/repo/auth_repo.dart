import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/auth/domain/entities/create_user_entity.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, CreateUserEntity>> signUpWithEmail(
    String name,
    String email,
    String phoneNumber,
    String password,
  );

  Future<Either<Failure, CreateUserEntity>> signInWithEmail(
    String password,
    String email,
  );
  Future<Either<Failure,void>> addUser(String path, UserEntity user);
}
