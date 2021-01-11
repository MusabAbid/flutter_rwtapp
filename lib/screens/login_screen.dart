import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rwtapp/sidebar/sidebar_layout.dart';
import 'package:flutter_rwtapp/utilities/constants.dart';
import 'package:flutter_rwtapp/screens/signup_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget _buildEmailTF(bool forget) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      forget
          ? Text(
              'Enter Email',
              style: kLabelStyle,
            )
          : Text(
              "User Name",
              style: kLabelStyle,
            ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 45.0,
        child: forget
            ? TextField(
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
                  hintText: "Enter your Email",
                  hintStyle: kHintTextStyle,
                ),
              )
            : TextField(
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
                  hintText: "Enter User name",
                  hintStyle: kHintTextStyle,
                ),
              ),
      )
    ],
  );
}

class _LoginScreenState extends State<LoginScreen> {
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
  Widget _buildSignUpBtn() {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Text(
          "New Here? SignUp Now",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildForgetPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {
          setState(() {
            forget = !forget;
          });
        },
        padding: EdgeInsets.only(
          left: 0.0,
        ),
        child: forget
            ? Text(
                "Back to Login?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              )
            : Text(
                "Forget Password?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
      ),
    );
  }

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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logos/backg.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 90.0,
                        child: Image.asset('assets/logos/logo.png'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(forget),
                      SizedBox(
                        height: 10.0,
                      ),
                      forget ? Container() : _buildPasswordTF(),
                      _buildForgetPasswordBtn(),

                      forget?Container(
                        decoration: BoxDecoration(
                            color:Color.fromRGBO(39, 99, 209,10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 8),
                          child: Text('Send Request',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                      ):GestureDetector(
                        onTap: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => SideBarLayout()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:Color.fromRGBO(39, 99, 209,10),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                            child: Text('Login',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,

                            ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      _buildSignUpBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
