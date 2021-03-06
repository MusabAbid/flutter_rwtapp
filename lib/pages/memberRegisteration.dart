import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rwtapp/sidebar/sidebar_layout.dart';
import 'package:flutter_rwtapp/utilities/constants.dart';

class MemberRegistration extends StatefulWidget with NavigationStates {
  @override
  _MemberRegistrationState createState() => _MemberRegistrationState();
}

Widget _buildUserNameTF(bool forget) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Full Name",
        style: kLabelStyle,
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 45.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 10.0),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromRGBO(39, 99, 209, 10),
            ),
            hintText: "Enter Full name",
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}

Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Email",
        style: kLabelStyle,
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.mail,
                color: Color.fromRGBO(39, 99, 209, 10),
              ),
              hintText: "Enter your Email",
              hintStyle: kHintTextStyle,
            ),
          )),
    ],
  );
}

class _MemberRegistrationState extends State<MemberRegistration> {
  bool forget = false;

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromRGBO(39, 99, 209, 10),
              ),
              hintText: "Enter your Password",
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildForgetPasswordBtn() {
  //   return Container(
  //     alignment: Alignment.center,
  //     child: FlatButton(
  //       onPressed: () {
  //         setState(() {
  //           forget = !forget;
  //         });
  //       },
  //       padding: EdgeInsets.only(
  //         left: 0.0,
  //       ),
  //       child: forget
  //           ? Text(
  //         "Back to Login?",
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       )
  //           : Text(
  //         "Forget Password?",
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildLoginBtn() {
  //   return GestureDetector(
  //     onTap: () {
  //
  //     },
  //     child: Container(
  //       height: 45.0,
  //       width: 300.0,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 2),
  //             blurRadius: 6.0,
  //           ),
  //         ],
  //         image: DecorationImage(
  //           image: AssetImage("assets/logos/login.png"),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Center(child: Text('Register Member')),
        ),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   'Register New Member',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  Card(child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Member Detail',
                          style: TextStyle(

                              fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildUserNameTF(forget),
                      SizedBox(
                        height: 5.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 5.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),],),
                  )),
                  GestureDetector(
                          onTap: () {
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(39, 99, 209, 10),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 8),
                                child: Text(
                                  'Register Member',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
