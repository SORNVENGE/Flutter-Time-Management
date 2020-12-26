import 'package:flutter/material.dart';

class Login {
  String name;
  String companyName;
  String access_token;
  String message;
  bool status;
  Login({
    this.name,
    this.companyName,
    this.access_token,
    this.message,
    this.status,
  });
}

class Sigin {
  final String login;
  final String password;
  Sigin({
    @required this.login,
    @required this.password,
  });
}
