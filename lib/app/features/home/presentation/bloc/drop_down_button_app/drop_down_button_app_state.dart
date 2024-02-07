part of 'drop_down_button_app_bloc.dart';

final class DropDownButtonAppState extends Equatable {
  const DropDownButtonAppState({
    this.items = const [],
    this.selectItem,
    this.date,
  });

  final List<ObjectEntity> items;
  final ObjectEntity? selectItem;
  final DateTime? date;

  DropDownButtonAppState copyWith({
    List<ObjectEntity>? items,
    ObjectEntity? selectItem,
    DateTime? date,
  }) {
    return DropDownButtonAppState(
      items: items ?? this.items,
      selectItem: selectItem ?? this.selectItem,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [items, selectItem, date];
}
