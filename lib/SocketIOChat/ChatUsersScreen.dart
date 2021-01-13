import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/SocketIOChat/User.dart';
import 'package:flutter_rwtapp/SocketIOChat/Global.dart';
import 'package:flutter_rwtapp/SocketIOChat/ChatScreen.dart';
import 'package:flutter_rwtapp/SocketIOChat/LoginScreen.dart';

class ChatUsersScreen extends StatefulWidget {
  @override
  _ChatUsersScreenState createState() => _ChatUsersScreenState();
}

class _ChatUsersScreenState extends State<ChatUsersScreen> {
  List<User> _chatUsers;
  bool _connectedToSocket;
  String _connectMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectedToSocket = false;
    _connectMessage = 'Connecting...';
    _chatUsers = G.getUsersFor(G.loggedInUser);
    _connectToSocket();
  }

  _connectToSocket() async{
    print(
        'Connecting Logged in User${G.loggedInUser.name},${G.loggedInUser.id}');
    G.initSocket();
   await G.socketUtils.initSocket(G.loggedInUser);
    G.socketUtils.connectToSocket();
    G.socketUtils.setOnConnectListener(onConnect);
    G.socketUtils.setOnConnectionErrorListener(onConnectionError);
    G.socketUtils.setOnConnectionTimeOutListener(onConnectionTimeout);
    G.socketUtils.setOnDisconnectListener(onDisconnect);
    G.socketUtils.setOnErrorListener(onError);
  }
  onError(data){
    print('onError $data');
    setState(() {
      _connectedToSocket=false;
      _connectMessage="Connection Error";
    });
  }
  onDisconnect(data) {
//
    print('onDisconnect $data');
    setState(() {
      _connectedToSocket=false;
      _connectMessage="Disconnected";
    });
  }

  onConnectionTimeout(data) {
    //
    print('onConnectionTimeout $data');
    setState(() {
      _connectedToSocket=false;
      _connectMessage="Connection Timed out";
    });
  }

  onConnectionError(data) {
    //
    print('onConnectionError $data');
    setState(() {
      _connectedToSocket=false;
      _connectMessage="Connection Error";
    });
  }

  onConnect(data) {
//
  print('Connected $data');
  setState(() {
    _connectedToSocket=true;
    _connectMessage="Connected";
  });

  }

  _openChatScreen(context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChatScreen(),
    ));
  }

  _openLoginScreen(context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Users'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              G.socketUtils.closeConnection();
              _openLoginScreen(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text(_connectedToSocket?'Connected':_connectMessage),
            Expanded(
              child: ListView.builder(
                itemCount: _chatUsers.length,
                itemBuilder: (context, index) {
                  User user = _chatUsers[index];
                  return ListTile(
                    onTap: () {
                      G.toChatUser = user;
                      _openChatScreen(context);
                    },
                    title: Text(user.name),
                    subtitle: Text('Id ${user.id}, Email: ${user.email}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
