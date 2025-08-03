import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return InkWell(
      onTap: homeType.onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.blue.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.only(bottom: mq.height * 0.02),
        elevation: 0,
        child: homeType.leftAlign
            ? Row(
                children: [
                  Padding(
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/lottie/${homeType.lottie}',
                      width: mq.width * 0.35,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    homeType.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  const Spacer(),
                  Text(
                    homeType.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(flex: 2),
                  Padding(
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/lottie/${homeType.lottie}',
                      width: mq.width * 0.35,
                    ),
                  ),

                  const Spacer(),
                ],
              ),
      ).animate().fade(duration: 1.seconds, curve: Curves.easeIn),
    );
  }
}
