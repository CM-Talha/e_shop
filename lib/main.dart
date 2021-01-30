import 'package:e_shop/screens/LandingScreen.dart';
import 'package:e_shop/screens/LoginScreen.dart';
import 'package:e_shop/screens/MainPage.dart';
import 'package:e_shop/screens/Sign-Up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
main(List<String> args) async{
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop',
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
       routes: <String, WidgetBuilder> {   
      '/a': (BuildContext context) => Login(),
      '/b': (BuildContext context) => SignUp(),
      '/c': (BuildContext context) => MainPage(),
    },
    );
  }
}
