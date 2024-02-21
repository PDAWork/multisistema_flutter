part of 'drawer_app_bloc.dart';

@freezed
final class DrawerAppState {
  final DrawerAppEntity drawerAppEntity;

  const DrawerAppState({
    required this.drawerAppEntity,
  });

  factory DrawerAppState.initial() => DrawerAppState(
        drawerAppEntity: DrawerAppEntity(
          fristName: "",
          email: "",
          balanceObject: 0,
        ),
      );

  DrawerAppState copyWith({
    DrawerAppEntity? drawerAppEntity,
  }) {
    return DrawerAppState(
      drawerAppEntity: drawerAppEntity ?? this.drawerAppEntity,
    );
  }
}
