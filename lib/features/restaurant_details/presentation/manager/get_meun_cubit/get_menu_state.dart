part of 'get_menu_cubit.dart';

@immutable
sealed class GetMenuState {}

final class GetMenuInitial extends GetMenuState {}

final class GetMenuLoading extends GetMenuState {}

final class GetMenuFailuer extends GetMenuState {
  GetMenuFailuer({required this.err});

  final String err;
}

final class GetMenuSuccess extends GetMenuState {
  GetMenuSuccess({required this.menus});

  final List<MenuItemEntity> menus;
}
