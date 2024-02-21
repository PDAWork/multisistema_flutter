part of 'drawer_app_bloc.dart';

@freezed
sealed class DrawerAppEvent {}

final class DrawerAppInitEvent extends DrawerAppEvent {}

final class DrawerAppClearCacheEvent extends DrawerAppEvent {}
