import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/data/models/movies_result_model.dart';

// This file is responsible for the core implemtation of sending http request
class APIClient {
  final Client _client;
  // Clinet is used to manages multiple http request from the same server

  APIClient(this._client);

  dynamic get(String path) async {
    final String url =
        "${APIConstants.BASE_URL}$path?api_key=${APIConstants.API_KEY}";
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
}
