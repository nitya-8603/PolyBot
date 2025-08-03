import 'package:ai_assistant/feature/chatbot_feature.dart';
import 'package:ai_assistant/feature/image_feature.dart';
import 'package:ai_assistant/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

enum HomeType { AiChatbot, AiImage, AiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
    HomeType.AiChatbot => 'AI ChatBot',
    HomeType.AiImage => 'AI Image creator',
    HomeType.AiTranslator => 'AI Translator',
  };

  String get lottie => switch (this) {
    HomeType.AiChatbot => 'cat.json',
    HomeType.AiImage => 'robo.json',
    HomeType.AiTranslator => 'guy_talking.json',
  };

  bool get leftAlign => switch (this) {
    HomeType.AiChatbot => true,
    HomeType.AiImage => false,
    HomeType.AiTranslator => true,
  };

  EdgeInsets get padding => switch (this) {
    HomeType.AiChatbot => EdgeInsets.zero,
    HomeType.AiImage => const EdgeInsets.all(20),
    HomeType.AiTranslator => EdgeInsets.zero,
  };

  VoidCallback get onTap => switch (this) {
    HomeType.AiChatbot => () => Get.to(() => ChatbotFeature()),
    HomeType.AiImage => () => Get.to(() => ImageFeature()),
    HomeType.AiTranslator => () => Get.to(() => TranslatorFeature()),
  };
}
