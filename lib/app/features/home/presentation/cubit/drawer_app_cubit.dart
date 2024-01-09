import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_app_state.dart';

class DrawerAppCubit extends Cubit<DrawerAppState> {
  DrawerAppCubit() : super(DrawerAppInitial());
}
