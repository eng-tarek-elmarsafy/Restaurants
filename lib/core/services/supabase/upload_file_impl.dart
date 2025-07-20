import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/supabase/upload_file.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadFileImpl implements UploadFile {
  UploadFileImpl({required this.uploadFileServices});
  final UploadFileServices uploadFileServices;
  @override
  Future<Either<Failure, String>> uploadFile(String path, File file) async {
    try {
      final respons = await uploadFileServices.uploadFile(path, file);
      return right(respons);
    } on StorageException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}

abstract interface class UploadFile {
  Future<Either<Failure, String>> uploadFile(String path, File file);
}
