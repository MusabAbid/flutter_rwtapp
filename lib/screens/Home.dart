import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';

import 'home_screen.dart';
class AddPage extends StatefulWidget with NavigationStates {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
            backgroundColor: Colors.green,
            title: Text("DashBoard" ,style: TextStyle( color: Colors.white),)
          ),

         body:HomeScreen(),

      ),
      );
  }
}
