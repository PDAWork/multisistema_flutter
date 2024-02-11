base class TariffModel {
  final int id;
  final String name;
  final int cost;

  TariffModel({
    required this.id,
    required this.name,
    required this.cost,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) {
    return TariffModel(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
    );
  }
}
