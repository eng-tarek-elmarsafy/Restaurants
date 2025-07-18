import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/features/auth/data/models/create_user_model.dart';
import 'package:restaurants/features/auth/data/models/user_model.dart';
import 'package:restaurants/features/auth/domain/entities/create_user_entity.dart';
import 'package:restaurants/features/auth/domain/entities/user_entity.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this.services, {required this.authServices});

  final AuthServices authServices;
  final StorServices services;

  @override
  Future<Either<Failure, CreateUserEntity>> signUpWithEmail(
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
      Prefs.setString(kEmail, email);
      Prefs.setString(kUserName, name);
      Prefs.setString(kUserId, user.id);
      Prefs.setString(kUserphone, phoneNumber);
      Prefs.setBool(kIsSignIn, true);
      return right(CreateUserModel.fromUser(user));
    } on EmailConfirmationPendingFailure catch (e) {
      return left(EmailConfirmationPendingFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateUserEntity>> signInWithEmail(
    String password,
    String email,
  ) async {
    try {
      final user = await authServices.signInWithEmail(email, password);
      Prefs.setString(kEmail, user.email!);
      Prefs.setString(kUserName, user.userMetadata!['userName']);
      Prefs.setString(kUserphone, user.userMetadata!['numberPhone']);
      Prefs.setString(kUserId, user.id);
      Prefs.setBool(kIsSignIn, true);
      return right(CreateUserModel.fromUser(user));
    } on EmailConfirmationPendingFailure catch (e) {
      return left(EmailConfirmationPendingFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addUser(String path, UserEntity user) async {
    try {
      await services.addData(path, UserModel.fromEntity(user).toJson());
      return right(null);
    } on WebSocketException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String path, String uId) async {
    try {
      final respons = await services.getData(path, 'id', uId);

      return right(UserModel.fromJson(respons[0]));
    } on PostgrestException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
