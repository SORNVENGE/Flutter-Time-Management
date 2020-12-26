import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/model/Authorizationlogin.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as Http;
import 'package:shared_preferences/shared_preferences.dart';

mixin ConnectedLogin on Model {
  Login authLogin = new Login();
}
mixin LoginModel on ConnectedLogin {
  Login get authorization {
    return authLogin;
  }

  addToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiToken', token);
  }

  Future login(Sigin sigin, BuildContext context,
      void Function(String msg) showError) async {
    try {
      var signinBody = {"login": sigin.login, "password": sigin.password};
      Http.Response response;
      response = await Http.post(
        'http://timemanagement-stage.s7.bi-kay.com/api/login',
        body: json.encode(signinBody),
        headers: {'Content-Type': 'application/json'},
      );
      switch (response.statusCode) {
        case 200:
          var responseData = json.decode(response.body);

          authLogin.access_token = responseData['access_token'];
          addToken(authLogin.access_token);
          authLogin.name = responseData['name'];
          authLogin.message = responseData['message'];
          authLogin.companyName = responseData['companyName'];
          Navigator.of(context).pushNamed('/mainScreen');

          return authLogin;
          break;
        case 401:
          showError("Please Check Your Username and Password");
          print("Click");
          break;
        default:
          print("Click");
          break;
      }
    } catch (e) {
      showError(e);
    }
  }
}
