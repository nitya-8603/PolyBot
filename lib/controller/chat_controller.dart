import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/helper/my_dialog.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController {
  final textC = TextEditingController();
  final scrollC = ScrollController();
  final list = <Message>[
    Message(msgType: MessageType.bot, msg: 'Hello!! How can I help you?'),
  ].obs;

  void askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      list.add(Message(msgType: MessageType.user, msg: textC.text));

      list.add(Message(msgType: MessageType.bot, msg: ''));
      _scrollDown();
      final res = await APIs.getAnswer(textC.text);
      list.removeLast();
      list.add(Message(msgType: MessageType.bot, msg: res));
      _scrollDown();

      textC.text = '';
    } else
      MyDialog.info('Ask Something...');
  }

  void _scrollDown() {
    scrollC.animateTo(
      scrollC.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
