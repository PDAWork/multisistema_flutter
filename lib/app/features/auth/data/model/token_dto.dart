class TokenDto {
  final String refreshToken;
  final String accessToken;

  TokenDto({
    required this.refreshToken,
    required this.accessToken,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) {
    return TokenDto(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}
