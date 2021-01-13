import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/SocketIOChat/ChatUsersScreen.dart';
import 'package:flutter_rwtapp/SocketIOChat/User.dart';
import 'package:flutter_rwtapp/SocketIOChat/Global.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userNameController = TextEditingController();
    G.initDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _userNameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              child: Text('LOGIN'),
              onPressed: () {
                _loginBtnTap();
              },
            ),
          ],
        ),
      ),
    );
  }

  _loginBtnTap() {
    if (_userNameController.text.isEmpty) {
      return;
    }
    User me=G.dummyUsers[0];
    if(_userNameController.text!='a'){
      me=G.dummyUsers[1];
    }
    G.loggedInUser=me;

    _openChatUsersListScreen(context);
  }

  _openChatUsersListScreen(context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChatUsersScreen()));
  }
}
