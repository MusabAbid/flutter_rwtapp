import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdaptiveFlatButton(this.text,this.handler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
      onPressed: handler,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    )
        : InkWell(
          onTap: handler,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 99, 209, 10),
              borderRadius: BorderRadius.circular(5),

            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
        );
  }
}
