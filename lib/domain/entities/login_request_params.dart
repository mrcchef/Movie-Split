import 'package:flutter/material.dart';

class LoginRequestParams {
  final String username;
  final String password;

  LoginRequestParams({@required this.username, @required this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
