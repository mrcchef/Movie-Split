import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/data/core/api_clinet.dart';
import 'package:flutter_movie/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWidgetLogin(
      {@required Map<String, dynamic> requestBody});
  Future<String> createSession({@required Map<String, dynamic> requestBody});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final APIClient apiClient;

  AuthenticationRemoteDataSourceImpl(this.apiClient);

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final responseBody = await apiClient.get('authentication/token/new');
    print(responseBody);
    final requestTokenModel = RequestTokenModel.fromJson(responseBody);
    return requestTokenModel;
  }

  @override
  Future<RequestTokenModel> validateWidgetLogin(
      {@required Map<String, dynamic> requestBody}) async {
    final responseBody = await apiClient
        .post('authentication/token/validate_with_login', params: requestBody);
    print('validate widget Login reponse body:$responseBody');
    final requestTokenModel = RequestTokenModel.fromJson(responseBody);
    return requestTokenModel;
  }

  @override
  Future<String> createSession(
      {@required Map<String, dynamic> requestBody}) async {
    final responseBody =
        await apiClient.post('authentication/session/new', params: requestBody);
    print(responseBody);

    // If we have successfully genereated session id then success will be true
    // If true we will return session id
    // other wise we will return null and manage null in further
    return responseBody['success'] ? responseBody['session_id'] : null;
  }

  Future<bool> deleteSession(String sessionId) async {
    final responseBody = await apiClient.deleteWithBody(
        'authentication/session',
        params: {"session_id": sessionId});

    // If null then it will return false
    return responseBody['success'] ?? false;
  }
}
