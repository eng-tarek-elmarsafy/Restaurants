import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/helper/backend_endpoint.dart';
import '../../../../core/services/stor_services.dart';
import '../models/meun_model.dart';
import '../../domain/entites/meun_entity.dart';
import '../../domain/repo/menu_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MeunRepoImpl extends MeunRepo {
  MeunRepoImpl({required this.services});

  final StorServices services;

  @override
  Future<Either<Failure, List<MenuItemEntity>>> getMeunRestaurant(
    String path,
    String restaurantId,
  ) async {
    try {
      var result = await services.getData(
        path,
        BackendEndpoint.getMenu,
        restaurantId,
      );

      final List<MenuItemEntity> menus =
          result
              .map<MenuItemEntity>((e) => MeunModel.fromJesom(e).toEntity())
              .toList();

      return right(menus);
    } on StorageException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
