import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/SocketIOChat/User.dart';
import 'package:flutter_rwtapp/SocketIOChat/ChatMessageModel.dart';
import 'package:flutter_rwtapp/SocketIOChat/Global.dart';
import 'package:flutter_rwtapp/SocketIOChat/ChatTitle.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
List<ChatMessageModel> _chatMessages;
User _toChatUser;
UserOnlineStatus _userOnlineStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatMessages=List();
    _toChatUser=G.toChatUser;
    _userOnlineStatus=UserOnlineStatus.connecting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: ChatTitle(toChatUser: _toChatUser,userOnlineStatus:_userOnlineStatus ,),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  ChatMessageModel chatMessageModel = _chatMessages[index];
                  return Text(chatMessageModel.message);
                },
              ),
            ),
            _bottomChatArea(),
          ],
        ),
      ),
    );
  }
_bottomChatArea() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        _chatTextArea(),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: (){
            //
          },
        ),
      ],
    ),
  );
}

_chatTextArea() {
  return Expanded(
    child: TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Type message'),
    ),
  );
}
}
