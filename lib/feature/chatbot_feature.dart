import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with AI Assistant')),
      body: Obx(
        () => ListView(
          controller: _c.scrollC,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: mq.height * 0.02,
            bottom: mq.height * 0.1,
          ),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.textC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  hintText: 'Ask me anything you want...',
                  isDense: true,
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(Icons.rocket_launch, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
