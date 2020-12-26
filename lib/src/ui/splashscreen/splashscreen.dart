import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String myToken = '';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    myToken = prefs.getString('apiToken') ?? '';
    if (myToken != '') {
      model.authLogin.access_token = myToken;
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pushNamed('/mainScreen');
      });
    } else {
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pushNamed('/loginScreen');
      });
    }
  }

  _buildBody() {
    return Container(
        color: Color(0xFFC3D7F3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 154,
              child: Image.asset('assets/logo.png'),
            )),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: CircularProgressIndicator(),
            )
          ],
        ));
  }
}
