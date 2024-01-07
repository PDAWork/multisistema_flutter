part of 'drop_down_button_app_cubit.dart';

sealed class DropDownButtonAppState extends Equatable {
  const DropDownButtonAppState(this.date);
  final DateTime date;

  @override
  List<Object> get props => [];
}

final class DropDownButtonAppInitial extends DropDownButtonAppState {
  const DropDownButtonAppInitial(super.date);
}

final class LoadlState extends DropDownButtonAppState {
  const LoadlState(super.date);
}

final class SeccuceState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const SeccuceState({
    required this.items,
    required this.selectItem,
    required DateTime date,
  }) : super(date);
} // ??

final class OnSelectItemState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const OnSelectItemState({
    required this.items,
    required this.selectItem,
    required DateTime date,
  }) : super(date);
}

final class OnChangedItemState extends DropDownButtonAppState {
  final List<ObjectEntity> items;
  final ObjectEntity selectItem;

  const OnChangedItemState({
    required this.items,
    required this.selectItem,
    required DateTime date,
  }) : super(date);
}

final class ErrorState extends DropDownButtonAppState {
  final String errorMessage;

  const ErrorState({required this.errorMessage, required DateTime date})
      : super(date);
}
