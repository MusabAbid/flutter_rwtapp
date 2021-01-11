import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/job_model.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';
import 'package:flutter_rwtapp/screens/splash_screen.dart';
import 'package:flutter_rwtapp/models/take_donation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/specification_list.dart';
import 'package:flutter_rwtapp/models/past_TakeDonation_model.dart';
void main() => runApp(MyApp());
Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
var newColor=0xff2763D1;
MaterialColor color1 = MaterialColor(newColor, color);
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (ctx) => Jobs(),
    ),
          ChangeNotifierProvider(
            create: (ctx) => Educations(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ListTakeDonation(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Pasts(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Specification(),
          ),
    ],
    child: MaterialApp(
      title: 'RWT Login UI',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch:color1,
      ),
      home:MyHomePage(),
    ));
  }
}
