base class PayDto {
  final int tariffId;

  PayDto({required this.tariffId});

   Map<String,dynamic> toJson() {
    return {
      'tariffId': tariffId,
    };
  }
}
