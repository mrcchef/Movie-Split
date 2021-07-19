import 'dart:convert';

import 'package:flutter_movie/data/core/unauthourized_exception.dart';
import 'package:http/http.dart';

import 'package:flutter_movie/data/core/api_constraint.dart';

// This file is responsible for the core implemtation of sending http request
class APIClient {
  final Client _client;
  // Clinet is used to manages multiple http request from the same server

  APIClient(
    this._client,
  );

  String getPath(String path, {Map<dynamic, dynamic>? params}) {
    var paramsPath = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        if ((value as String).isNotEmpty) paramsPath += '&$key=$value';
      });
    }
    return "${APIConstants.BASE_URL}$path?api_key=${APIConstants.API_KEY}$paramsPath";
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final String url = getPath(path, params: params);
    print("get request url : $url");
    final response = await _client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, // ?
    );

    if (response.statusCode == 200) {
      // If it is success
      final responseBody = json.decode(response
          .body); // .body methods returns the string format of the response
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final String url = getPath(path);
    print("post request url : $url");
    final response = await _client.post(Uri.parse(url),
        body: json.encode(params),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401)
      throw UnauthourizedException();
    else
      throw Exception(response.reasonPhrase);
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', Uri.parse(getPath(path)));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);

    final response = await _client.send(request).then(
          (value) => Response.fromStream(value),
        );
    print(response.statusCode);
    if (response.statusCode == 200)
      return json.decode(response.body);
    else
      throw Exception(response.reasonPhrase);
  }
}
