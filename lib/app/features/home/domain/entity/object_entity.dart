import 'package:equatable/equatable.dart';

class ObjectEntity extends Equatable {
  final int id;
  final String label;
  final String house;
  final String number;

  const ObjectEntity({
    required this.id,
    required this.label,
    required this.house,
    required this.number,
  });

  factory ObjectEntity.empty() {
    return const ObjectEntity(
      id: -1,
      label: '',
      house: '',
      number: '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        label,
        house,
        number,
      ];
}
