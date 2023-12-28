part of 'drop_down_button_app_cubit.dart';

sealed class DropDownButtonAppState extends Equatable {
  const DropDownButtonAppState();

  @override
  List<Object> get props => [];
}

final class DropDownButtonAppInitial extends DropDownButtonAppState {}

final class LoadlState extends DropDownButtonAppState {}

final class SeccuceState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const SeccuceState({required this.items, required this.selectItem});
} // ??

final class OnSelectItemState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const OnSelectItemState({required this.items, required this.selectItem});
}

final class OnChangedItemState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const OnChangedItemState({required this.items, required this.selectItem});
}

final class ErrorState extends DropDownButtonAppState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});
}
