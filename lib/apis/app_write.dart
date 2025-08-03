import 'dart:developer';

import 'package:ai_assistant/helper/global.dart';
import 'package:appwrite/appwrite.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);
  static void init() {
    _client
        .setEndpoint(
          'https://nyc.cloud.appwrite.io/v1',
        ) // Your Appwrite Endpoint
        .setProject('688e49d10012e2490691') // Your project ID
        ;
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
        databaseId: 'MyDatabase',
        collectionId: 'ApiKey',
        documentId: 'geminiKey',
      );
      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
