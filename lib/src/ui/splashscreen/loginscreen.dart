import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/model/Authorizationlogin.dart';
import 'package:mobile_timesheet_makara_venge/src/scroped-model/main.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'dart:async';

MainModel model = new MainModel();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userName = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  GlobalKey<ScaffoldState> globalKey = new GlobalKey();
  bool obscured = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
        key: globalKey,
        // body: _buildBodyController(context),
        body: !_isLoading
            ? _buildBodyController(context)
            : LoadingOverlay(
                child: SingleChildScrollView(),
                isLoading: _isLoading,
                // additional parameters
                opacity: 0.5,
                progressIndicator: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void showOverlay() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget _buildRaisedButtonLogin(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_userName.text == '' || _password.text == '') {
          showAlertDialog(context);
        } else {
          showOverlay();
          Sigin signinInfo =
              new Sigin(login: _userName.text, password: _password.text);
          model.login(signinInfo, context, (msgError) {
            globalKey.currentState.showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                content: new Text(msgError)));
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        height: 45.0,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldUserName() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45.0,
      decoration: BoxDecoration(
        color: Color(0xFFC3D7F3),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: 45.0,
              decoration: BoxDecoration(
                color: Color(0xFFE4E6EB),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Icon(Icons.person)),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: TextField(
              controller: _userName,
              decoration: const InputDecoration.collapsed(hintText: "UserName"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextEditPassword() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45.0,
      decoration: BoxDecoration(
        color: Color(0xFFC3D7F3),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: 45.0,
            decoration: BoxDecoration(
              color: Color(0xFFE4E6EB),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: InkWell(
                onTap: () {
                  setState(() {
                    obscured = !obscured;
                  });
                },
                child: obscured == false
                    ? Icon(Icons.lock_open)
                    : Icon(Icons.lock)),
          ),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: TextField(
              controller: _password,
              obscureText: obscured,
              decoration: const InputDecoration.collapsed(hintText: "Password"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginLogo() {
    return Image.asset("assets/logologin.png", width: 100.0, height: 115.0);
  }

  Widget _buildBodyController(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              _buildLoginLogo(),
              SizedBox(
                height: 20,
              ),
              _buildTextFieldUserName(),
              SizedBox(
                height: 20,
              ),
              _buildTextEditPassword(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                child: _buildRaisedButtonLogin(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text("Username and Password Required"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
