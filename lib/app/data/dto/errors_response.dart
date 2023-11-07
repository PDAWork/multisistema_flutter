class ErrorsResponse {
  final String name;
  final String msg;

  ErrorsResponse({
    required this.name,
    required this.msg,
  });

  factory ErrorsResponse.fromJson(Map<String, dynamic> json) {
    return ErrorsResponse(
      name: json["name"],
      msg: json['msg'],
    );
  }
}
