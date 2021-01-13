import 'dart:io';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter_rwtapp/SocketIOChat/User.dart';

class SocketUtils {
  static String _serverIP =
      Platform.isIOS ?'http://localhost':'http://192.168.18.90';
  //http://10.0.0.2
  static const int SERVER_PORT = 6000;
  static String _connectUrl = '$_serverIP:$SERVER_PORT';

  //Events
  static const String ON_MESSAGE_RECEIVED = 'receive_message';
  static const String IS_USER_ONLINE_EVENT = 'check_online';

  //Status
  static const int STATUS_MESSAGE_NOT_SENT = 1001;
  static const int STATUS_MESSAGE_SENT = 1002;

  //Type OF CHAT
  static const String SINGLE_CHAT = 'single_chat';
  User _fromUser;
  SocketIO _socket;
  SocketIOManager _manager;

  initSocket(User fromUser) async {
    this._fromUser = fromUser;
    print('Connecting...${fromUser.name}...');
    await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(_socketOptions());
  }

  _socketOptions() {
    final Map<String, String> userMap = {'from': _fromUser.id.toString()};
    return SocketOptions(_connectUrl,
        enableLogging: true,
        transports: [Transports.WEB_SOCKET],
        query: userMap);
  }
  setOnConnectListener(Function onConnect){

    _socket.onConnect((data) {
      onConnect(data);
    });

  }
  setOnConnectionTimeOutListener(Function onConnectionTimeout){
    _socket.onConnectTimeout((data) {
      onConnectionTimeout(data);
    });

  }
  setOnConnectionErrorListener(Function onConnectionError){
_socket.onConnectError((data) {
  onConnectionError(data);
});
  }
  setOnErrorListener(Function onError){
    _socket.onError((data) {
      onError(data);
    });
  }
  setOnDisconnectListener(Function onDisconnect){
    _socket.onDisconnect((data) {
      onDisconnect(data);
    });
  }
  connectToSocket(){
    if(_socket==null){
      print('Socket is Null');
      return;
    }
    _socket.connect();
  }
  closeConnection(){
    if(_socket!=null){
      print('Closing Connection');
      _manager.clearInstance(_socket);
    }
  }
}
