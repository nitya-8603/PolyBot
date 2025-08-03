class Message {
  String msg;
  final MessageType msgType;

  Message({required this.msgType, required this.msg});
}

enum MessageType { user, bot }
