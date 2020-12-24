import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.grey,
  fontFamily: 'OpenSans'

);

final kLabelStyle = TextStyle(
  color: Color.fromRGBO(39, 99, 209,10),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);