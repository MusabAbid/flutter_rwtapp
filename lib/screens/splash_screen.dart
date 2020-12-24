import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/screens/login_screen.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    var height;
    setState(() {
      if (isLandScape) {
        height = mediaQuery.size.width;
      } else {
        height = mediaQuery.size.height;
      }
    });
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logos/backg.png"), fit: BoxFit.cover),
        ),
      ),
      Center(child: Image.asset('assets/logos/logo.png')),
    ]);
  }
}
