import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../constrains.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/helper/backend_endpoint.dart';
import '../../../../core/services/shared_preferences.dart';
import '../../../../core/services/stor_services.dart';
import '../models/history_orders_modile.dart';
import '../../domain/entity/history_orders_entity.dart';
import '../../domain/repo/history_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HistoryRepoImpl extends HistoryRepo {
  HistoryRepoImpl({required this.storServices});
  final StorServices storServices;
  @override
  Future<Either<ServerFailure, List<HistoryOrdersEntity>>>
  getAllOrders() async {
    try {
      final data = await storServices.getData(
        BackendEndpoint.ordersPath,
        'user_id',
        Prefs.getString(kUserId),
      );
      return right(data.map((e) => HistoryOrdersModile.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      log(e.message);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
