import 'package:dartz/dartz.dart';
import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/features/cart/data/models/ordar_model.dart';
import 'package:restaurants/features/cart/domain/entites/ordar_entity.dart';
import 'package:restaurants/features/cart/domain/repo/order_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRepoImpl extends OrderRepo {
  OrderRepoImpl({required this.storServices});

  final StorServices storServices;

  @override
  Future<Either<ServerFailure, void>> addOrder({OrderEntity? entity}) async {
    try {
      await storServices.addData(
        BackendEndpoint.ordersPath,
        OrderModel.fromEntity(entity!).toMap(),
      );
      return right(null);
    } on PostgrestException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
