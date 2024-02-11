base class PayModel {
  final String ulrPay;
  final String orderId;

  PayModel({
    required this.ulrPay,
    required this.orderId,
  });

  factory PayModel.fromJson(Map<String, dynamic> json) {
    return PayModel(
      ulrPay: json['url'],
      orderId: json['orderId'],
    );
  }
}
