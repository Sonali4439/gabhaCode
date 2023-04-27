import 'dart:async';

import 'package:flutter/material.dart';

import 'activityMobileScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ActivityMobileScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/images/gabha_logo.png",height: 150,width:150)),
      ),
    );
  }
}