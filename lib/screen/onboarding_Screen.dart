import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
        title: 'Ask me anything',
        subtitle:
            'I can be your Best Friend & You can ask me anything & I will help you!!',
        lottie: 'guy_talking.json',
      ),
      Onboard(
        title: 'Imagination to Reality',
        subtitle:
            'Just imagine something and let me know. I will help create something wonderful for you :) ',
        lottie: 'robo.json',
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isLast = index == list.length - 1;
          return Column(
            children: [
              Lottie.asset(
                'assets/lottie/${list[index].lottie}',
                height: mq.height * 0.6,
                width: isLast ? mq.width * 0.7 : null,
              ),
              Text(
                '${list[index].title}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: mq.height * 0.015),
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  '${list[index].subtitle}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, letterSpacing: 0.5),
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 10,
                children: List.generate(
                  2,
                  (i) => Container(
                    width: i == index ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (isLast) {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (_) => HomeScreen()),
                    // );
                    Get.off(() => const HomeScreen());
                  } else {
                    c.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.bounceIn,
                    );
                  }
                },
                text: isLast ? 'Finish' : 'Next',
              ),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
