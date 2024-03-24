import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Column(
      children: [
        Center(child: LottieBuilder.asset("Lottie/insta_splash.json", width: 100, height:100,),)
      ],
    ),
    nextScreen: PageBone(),
    backgroundColor: Color.fromARGB(255, 201, 3, 79),
    splashIconSize: 140,);
  }
}