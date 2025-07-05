import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    String name,
    String email,
    String phoneNumber,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithEmail(
    String password,
    String email,
  );
}
