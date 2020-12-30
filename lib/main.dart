import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/job_model.dart';
import 'package:flutter_rwtapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (ctx) => Jobs(),
    ),
    ],
    child: MaterialApp(
      title: 'RWT Login UI',
      debugShowCheckedModeBanner:false,
      home:MyHomePage(),
    ));
  }
}
