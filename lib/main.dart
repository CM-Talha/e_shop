import 'package:e_shop/screens/LandingScreen.dart';
import 'package:e_shop/screens/LoginScreen.dart';
import 'package:e_shop/screens/MainPage.dart';
import 'package:e_shop/screens/Sign-Up.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
       routes: <String, WidgetBuilder> {   
      '/a': (BuildContext context) => Login(),
      '/b': (BuildContext context) => SignUp(),
      '/c': (BuildContext context) => MainPage(),
    },
    );
  }
}
