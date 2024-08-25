import 'dart:async';

import 'package:final_project/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isCompressed = true;
  void setAnimationTimer() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isCompressed = !_isCompressed;
      });
    });
  }

  void setTimer() {
    Timer(const Duration(seconds: 6), () {Navigator.push(context, MaterialPageRoute(builder: (context)=>OverviewScreen()));});
  }

  @override
  void initState() {
    super.initState();
    setAnimationTimer();
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack( 
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/bottom_left.png",),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/top_right.png",),
          ),
        Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: _isCompressed ? 0 : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  height: MediaQuery.sizeOf(context).width / 2,
                  child: Image.asset(
                      "assets/images/splashscreen_logo_foreground.png"),
                ),
                // JumpingDotsProgressIndicator(
                //   color: Colors.grey,
                //   numberOfDots: 5,
                // )
                ScalingText(". . .",style: const TextStyle(fontSize: 40),end: 2,)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
