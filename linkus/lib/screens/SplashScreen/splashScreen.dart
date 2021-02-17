import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linkus/constants/Constantcolors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:linkus/screens/LandingPage/landingPage.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  ConstantColors constantColors=ConstantColors();

  @override
  void initState() {
    Timer(
      Duration(
        seconds: 2
      ), ()=>Navigator.pushReplacement(context, PageTransition(
        child: LandingPage(), 
        type: PageTransitionType.rightToLeft)
        )
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'link',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: constantColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            children: <TextSpan>[
              TextSpan(
            text: 'US',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: constantColors.blueColor,
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
            )
            ]
          ),
        ),
        ),
    );
  }
}