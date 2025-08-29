import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/create_user_entity.dart';
import '../entities/user_entity.dart';

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
  Future<Either<Failure, void>> addUser(String path, UserEntity user);
  Future<Either<Failure, UserEntity>> getUser(String path, String uId);
  Future<Either<Failure, void>> signOut();
}
