// // import 'dart:developer';
// // import 'dart:io';
// // import 'dart:typed_data';

// // import 'package:ai_assistant/helper/global.dart';
// // import 'package:ai_assistant/helper/my_dialog.dart';
// // import 'package:flutter/material.dart';
// // import 'package:gallery_saver_plus/gallery_saver.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_rx/src/rx_types/rx_types.dart';
// // import 'package:get/route_manager.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:path_provider/path_provider.dart';
// // import 'package:share_plus/share_plus.dart';

// // enum Status { none, loading, complete }

// // class ImageController {
// //   final textC = TextEditingController();
// //   final status = Status.none.obs;
// //   Uint8List? imageBytes;

// //   Future<void> createImage() async {
// //     final prompt = textC.text.trim();
// //     if (prompt.isEmpty) {
// //       MyDialog.info('Please provide more detailed description.');
// //       return;
// //     }
// //     status.value = Status.loading;
// //     try {
// //       final response = await http.post(
// //         Uri.parse(
// //           'https://api-inference.huggingface.co/models/stabilityai/stable-diffusion-3.5-medium',
// //         ),
// //         headers: {
// //           'Authorization': 'Bearer $HUGGING_FACE_TOKEN',
// //           'Content-Type': 'application/json',
// //         },
// //         body: '{"inputs":"$prompt"}',
// //       );
// //       if (response.statusCode == 200) {
// //         imageBytes = response.bodyBytes;
// //         status.value = Status.complete;
// //         textC.clear();
// //       } else {
// //         MyDialog.error('Failed: ${response.statusCode}\n${response.body}');
// //         status.value = Status.none;
// //       }
// //     } catch (e) {
// //       MyDialog.error('Error: $e');
// //       log('createImage error: $e');
// //       status.value = Status.none;
// //     }
// //   }

// //   Future<void> downloadImage() async {
// //     if (imageBytes == null) {
// //       MyDialog.error('No image generated yet!');
// //       return;
// //     }
// //     try {
// //       MyDialog.showLoadingDialog();
// //       final dir = await getTemporaryDirectory();
// //       final file = await File(
// //         '${dir.path}/ai_image.png',
// //       ).writeAsBytes(imageBytes!);
// //       await GallerySaver.saveImage(file.path, albumName: appName);
// //       MyDialog.success('Image is saved to the gallery');
// //     } catch (e) {
// //       MyDialog.error('Something went wrong. Try again later!');
// //       log('downloadImage error: $e');
// //     } finally {
// //       Get.back();
// //     }
// //   }

// //   Future<void> shareImage() async {
// //     if (imageBytes == null) {
// //       MyDialog.error('No image generated yet!');
// //       return;
// //     }
// //     try {
// //       MyDialog.showLoadingDialog();
// //       final dir = await getTemporaryDirectory();
// //       final file = await File(
// //         '${dir.path}/ai_image.png',
// //       ).writeAsBytes(imageBytes!);
// //       MyDialog.success('Image prepared for sharing');
// //       await Share.shareXFiles([XFile(file.path)], text: 'Great Picture');
// //       await GallerySaver.saveImage(file.path, albumName: appName);
// //     } catch (e) {
// //       MyDialog.error('Failed to share image.');
// //       log('shareImage error: $e');
// //     } finally {
// //       Get.back();
// //     }
// //   }
// // }
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:ai_assistant/helper/global.dart';
// import 'package:ai_assistant/helper/my_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_saver_plus/gallery_saver.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/route_manager.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';

// enum Status { none, loading, complete }

// class ImageController {
//   final textC = TextEditingController();
//   final status = Status.none.obs;
//   Uint8List? imageBytes;

//   Future<void> createImage() async {
//     final prompt = textC.text.trim();
//     if (prompt.isEmpty) {
//       MyDialog.info('Please provide more detailed description.');
//       return;
//     }
//     status.value = Status.loading;
//     try {
//       final response = await http.post(
//         Uri.parse(
//           'https://api-inference.huggingface.co/models/Freepik/flux.1-lite-8B',
//         ),
//         headers: {
//           'Authorization': 'Bearer $HUGGING_FACE_TOKEN',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'inputs': prompt,
//           // Optional advanced params:
//           'parameters': {'guidance_scale': 3.5, 'num_inference_steps': 28},
//         }),
//       );
//       if (response.statusCode == 200) {
//         imageBytes = response.bodyBytes;
//         status.value = Status.complete;
//         textC.clear();
//       } else {
//         MyDialog.error('Failed: ${response.statusCode}\n${response.body}');
//         log('Failed: ${response.statusCode}\n${response.body}');
//         status.value = Status.none;
//       }
//     } catch (e) {
//       MyDialog.error('Error: $e');
//       log('createImage error: $e');
//       status.value = Status.none;
//     }
//   }

//   Future<void> downloadImage() async {
//     if (imageBytes == null) {
//       MyDialog.error('No image generated yet!');
//       return;
//     }
//     try {
//       MyDialog.showLoadingDialog();
//       final dir = await getTemporaryDirectory();
//       final file = await File(
//         '${dir.path}/ai_image.png',
//       ).writeAsBytes(imageBytes!);
//       await GallerySaver.saveImage(file.path, albumName: appName);
//       MyDialog.success('Image is saved to the gallery');
//     } catch (e) {
//       MyDialog.error('Something went wrong. Try again later!');
//       log('downloadImage error: $e');
//     } finally {
//       Get.back();
//     }
//   }

//   Future<void> shareImage() async {
//     if (imageBytes == null) {
//       MyDialog.error('No image generated yet!');
//       return;
//     }
//     try {
//       MyDialog.showLoadingDialog();
//       final dir = await getTemporaryDirectory();
//       final file = await File(
//         '${dir.path}/ai_image.png',
//       ).writeAsBytes(imageBytes!);
//       MyDialog.success('Image prepared for sharing');
//       await Share.shareXFiles([XFile(file.path)], text: 'Great Picture');
//       await GallerySaver.saveImage(file.path, albumName: appName);
//     } catch (e) {
//       MyDialog.error('Failed to share image.');
//       log('shareImage error: $e');
//     } finally {
//       Get.back();
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageController {
  final textC = TextEditingController();
  final status = Status.none.obs;
  Uint8List? imageBytes;

  Future<void> createImage() async {
    final prompt = textC.text.trim();
    if (prompt.isEmpty) {
      MyDialog.info('Please provide more detailed description.');
      return;
    }

    status.value = Status.loading;

    try {
      // Using Pollinations.ai - completely free, no API key needed
      final encodedPrompt = Uri.encodeComponent(prompt);
      final response = await http.get(
        Uri.parse('https://image.pollinations.ai/prompt/$encodedPrompt'),
        headers: {
          'User-Agent': 'Flutter-App/1.0', // Optional: Add user agent
        },
      );

      if (response.statusCode == 200) {
        imageBytes = response.bodyBytes;
        status.value = Status.complete;
        textC.clear();
        log('Image generated successfully with Pollinations.ai');
      } else {
        MyDialog.error(
          'Failed: ${response.statusCode}\n${response.reasonPhrase}',
        );
        log('Failed: ${response.statusCode}\n${response.reasonPhrase}');
        status.value = Status.none;
      }
    } catch (e) {
      MyDialog.error('Error: $e');
      log('createImage error: $e');
      status.value = Status.none;
    }
  }

  Future<void> downloadImage() async {
    if (imageBytes == null) {
      MyDialog.error('No image generated yet!');
      return;
    }
    try {
      MyDialog.showLoadingDialog();
      final dir = await getTemporaryDirectory();
      final file = await File(
        '${dir.path}/ai_image.png',
      ).writeAsBytes(imageBytes!);
      await GallerySaver.saveImage(file.path, albumName: appName);
      MyDialog.success('Image is saved to the gallery');
    } catch (e) {
      MyDialog.error('Something went wrong. Try again later!');
      log('downloadImage error: $e');
    } finally {
      Get.back();
    }
  }

  Future<void> shareImage() async {
    if (imageBytes == null) {
      MyDialog.error('No image generated yet!');
      return;
    }
    try {
      MyDialog.showLoadingDialog();
      final dir = await getTemporaryDirectory();
      final file = await File(
        '${dir.path}/ai_image.png',
      ).writeAsBytes(imageBytes!);
      MyDialog.success('Image prepared for sharing');
      await Share.shareXFiles([XFile(file.path)], text: 'Great Picture');
      await GallerySaver.saveImage(file.path, albumName: appName);
    } catch (e) {
      MyDialog.error('Failed to share image.');
      log('shareImage error: $e');
    } finally {
      Get.back();
    }
  }
}
