import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/screen/onboarding_Screen.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) =>
      //         Pref.showOnboarding ? OnboardingScreen() : HomeScreen(),
      //   ),
      // );
      Get.off(
        () =>
            Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(flex: 2),
            Card(
              // color: Colors.blue,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              // ),
              // child: Padding(
              //   padding: EdgeInsets.all(mq.width * 0.05),
              child: Image.asset(
                'assets/images/logo.png',
                width: mq.width * 0.4,
              ),
            ),

            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
