import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/screens/splash_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RWT Login UI',
      debugShowCheckedModeBanner:false,
      home:MyHomePage(),


    );
  }
}
