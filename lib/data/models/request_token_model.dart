class RequestTokenModel {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestTokenModel({this.success, this.expiresAt, this.requestToken});

  factory RequestTokenModel.fromJson(Map<String, dynamic> body) {
    return RequestTokenModel(
      success: body['success'],
      expiresAt: body['expires_at'],
      requestToken: body['request_token'],
    );
  }

  Map<String, dynamic> toJson() => {'request_token': requestToken};
}
