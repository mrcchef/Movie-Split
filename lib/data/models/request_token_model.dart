class RequestTokenModel {
  late final bool success;
  late final String expiresAt;
  late final String requestToken;

  RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> body) {
    return RequestTokenModel(
      success: body['success'],
      expiresAt: body['expires_at'],
      requestToken: body['request_token'],
    );
  }

  Map<String, dynamic> toJson() => {'request_token': requestToken};
}
