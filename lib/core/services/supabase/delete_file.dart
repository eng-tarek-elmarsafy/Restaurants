import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/services/storag_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DeleteFile {
  Future<Either<Failure, void>> deleteFile(String path, List<String> imageUrl);
}

class DeleteFileImpl implements DeleteFile {
  DeleteFileImpl({required this.supabase});

  final StoragServices supabase;
  @override
  Future<Either<Failure, void>> deleteFile(
    String path,
    List<String> imageUrl,
  ) async {
    try {
      await supabase.deleteFile(path, imageUrl);
      return right(null);
    } on StorageException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
