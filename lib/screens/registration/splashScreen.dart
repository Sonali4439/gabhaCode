import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gabha_app1/screens/dashboard/DashboardScreen.dart';
import 'package:gabha_app1/screens/registration/ActivityOnBoarding.dart';
import 'package:gabha_app1/screens/registration/welcomeScreen.dart';

import '../../core/Core.dart';
import '../../core/SharedPrefrenceSessionManager.dart';
import 'activityMobileScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Core core= new Core();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('timer----${core.getToken().toString()}');
    print(" Token===${PreferenceUtils.getString("gabha_token")}");

    _startTimer();
  }

 /* @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ActivityMobileScreen())));

  }*/
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

  void _startTimer() {
    Future.delayed(const Duration(seconds: 2), () async {

      PreferenceUtils.init();
      print('timer----${core.isUserLoggedIn()}');

      String token = PreferenceUtils.getString("gabha_token");

      print("token------ $token ");
      if(token != ""){

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const WelcomeScreen()));

      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityOnBoarding(),
          ),
        );
       /* Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityMobileScreen(),
          ),
        );*/
      }



    });
  }
}