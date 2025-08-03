import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/controller/image_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();

  Widget _aiImage() => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    child: switch (_c.status.value) {
      Status.none => Lottie.asset(
        'assets/lottie/robo.json',
        height: mq.height * 0.3,
      ),

      Status.loading => const CustomLoading(),
      Status.complete =>
        _c.imageBytes != null
            ? Image.memory(_c.imageBytes!, height: mq.height * 0.5)
            : Icon(Icons.error),
    },
  );

  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI Assistant'),
        actions: [
          Obx(
            () => _c.status.value == Status.complete
                ? IconButton(
                    padding: EdgeInsets.only(right: 6),
                    onPressed: _c.shareImage,
                    icon: Icon(Icons.share),
                  )
                : const SizedBox(),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: mq.width * 0.04,
          right: mq.width * 0.04,
          top: mq.height * 0.02,
          bottom: mq.height * 0.1,
        ),
        children: [
          TextFormField(
            controller: _c.textC,
            focusNode: _focusNode,
            minLines: 2,
            maxLines: null,
            textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: _hasFocus || _c.textC.text.isNotEmpty
                  ? null
                  : 'Imagine something beautiful and wonderful \nType here and I will create for you :)',
              isDense: true,
              hintStyle: TextStyle(fontSize: 13.5, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.015,
              vertical: mq.height * 0.015,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: mq.height * 0.5,
              alignment: Alignment.center,
              child: Obx(() => _aiImage()),
            ),
          ),
          Obx(
            () => CustomButton(
              onTap: _c.createImage,
              text: _c.status.value == Status.loading
                  ? 'Creating...'
                  : 'Create',
            ),
          ),
        ],
      ),

      floatingActionButton: Obx(
        () => _c.status.value == Status.complete
            ? Padding(
                padding: EdgeInsets.only(right: 6, bottom: 6),
                child: FloatingActionButton(
                  onPressed: _c.downloadImage,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Icon(Icons.save_alt_rounded),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
