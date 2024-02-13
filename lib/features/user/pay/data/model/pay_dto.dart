base class PayDto {
  final int tariffId;
  final int objectId;

  PayDto({
    required this.tariffId,
    required this.objectId,
  });

  Map<String, dynamic> toJson() {
    return {
      'tariffId': tariffId,
      'objectId': objectId,
    };
  }
}
