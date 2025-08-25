import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:restaurants/constrains.dart';

import 'package:restaurants/core/failure/failure.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/features/history/data/models/history_orders_modile.dart';
import 'package:restaurants/features/history/domain/entity/history_orders_entity.dart';
import 'package:restaurants/features/history/domain/repo/history_repo.dart';
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
