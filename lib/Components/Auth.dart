import 'package:flutter/material.dart';

void customSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg,
    {double height = 30, Color backgroundColor = Colors.black}) {
  if (_scaffoldKey == null || _scaffoldKey.currentState == null) {
    return;
  }
  _scaffoldKey.currentState.hideCurrentSnackBar();
  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    content: Text(
      msg,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
}
bool validateCredentials(
    GlobalKey<ScaffoldState> _scaffoldKey, String email, String password) {
  if (email == null || email.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter email id');
    return false;
  } else if (password == null || password.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter password');
    return false;
  } else if (password.length < 8) {
    customSnackBar(_scaffoldKey, 'Password must me 8 character long');
    return false;
  }

  var status = validateEmal(email);
  if (!status) {
    customSnackBar(_scaffoldKey, 'Please enter valid email id');
    return false;
  }
  return true;
}

bool validateEmal(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  return status;
}