import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/helper/backend_endpoint.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/menu_repo.dart';

part 'get_menu_state.dart';

class GetMenuCubit extends Cubit<GetMenuState> {
  GetMenuCubit(this.meunRepo) : super(GetMenuInitial());
  final MeunRepo meunRepo;
  Future<void> getMenu(String restaurantId) async {
    emit(GetMenuLoading());

    var result = await meunRepo.getMeunRestaurant(
      BackendEndpoint.menuPath,
      restaurantId,
    );

    result.fold(
      (failuer) => emit(GetMenuFailuer(err: failuer.message)),
      (success) => emit(GetMenuSuccess(menus: success)),
    );
  }
}
