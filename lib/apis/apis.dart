import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart' as http;

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

      final res = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": question},
              ],
            },
          ],
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final responseText =
            data['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
            'No response';
        log('Gemini says: $responseText');
        return responseText;
      } else {
        log('Gemini API Error: ${res.statusCode} - ${res.body}');
        return 'Something went wrong. Try again later.';
      }
    } catch (e) {
      log('Gemini API Error: $e');
      return 'Something went wrong. Try again later.';
    }
  }
}
