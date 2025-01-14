import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:netflix/ui/screen/home.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splash: Image.asset("assets/n.png"),
        nextScreen: home(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
      ),
    );
  }
}
