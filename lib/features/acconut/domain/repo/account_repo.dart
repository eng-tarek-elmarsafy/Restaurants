import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';

abstract class AccountRepo {
  Future<Either<Failure, void>> updateUserData(Map<String, dynamic> data);
}
