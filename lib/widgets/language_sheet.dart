import 'package:ai_assistant/controller/language_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LanguageSheet extends StatefulWidget {
  final LanguageController c;
  final RxString s;
  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final search = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: mq.width * 0.04,
        right: mq.width * 0.04,
        top: mq.height * 0.02,
      ),
      height: mq.height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            onChanged: (s) => search.value = s,
            //controller: _c.textC,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),

            decoration: InputDecoration(
              prefixIcon: Icon(Icons.translate, color: Colors.blue),
              hintText: 'Search Language...',
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final List<String> list = search.isEmpty
                  ? widget.c.lang
                  : widget.c.lang
                        .where((e) => e.toLowerCase().contains(search.value))
                        .toList();
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: mq.height * 0.02, left: 6),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      widget.s.value = list[index];
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: mq.height * 0.02),
                      child: Text(list[index]),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
