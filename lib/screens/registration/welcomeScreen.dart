import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/SharedPrefrenceSessionManager.dart';
import '../dashboard/DashboardScreen.dart';
import '../home/ActivityHomeLists.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AppColors appColors =  AppColors();

  @override
  void initState() {
    super.initState();
    print('--------${PreferenceUtils.getString("gabha_token")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    print('---userid-----${PreferenceUtils.getString("gabha_user_id")}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'तुमचं परत स्वागत आहे, ',
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: appColors.hintHeadingColor,),
                        children:  <TextSpan>[
                          TextSpan(text: PreferenceUtils.getString("gabha_user_name"), style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal,color: appColors.mainHeadingColor)),
                          TextSpan(text: '\n तूम्हाला परत बघून आनंद झाला ', style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: appColors.hintHeadingColor)),
                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 300,
                      child: Divider(
                        color: appColors.containerBorderColor,
                        thickness: 1,
                        height: 3,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Welcome Back, ',
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: appColors.hintHeadingColor),
                        children:  <TextSpan>[
                          TextSpan(text: PreferenceUtils.getString("gabha_user_name"), style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal,color: appColors.mainHeadingColor)),
                          TextSpan(text: '\n It feels great to see you again !', style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: appColors.hintHeadingColor)),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:   Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.mainHeadingColor,
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 0),
                      textStyle: const TextStyle(
                          fontSize: 14, color: Colors.white)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child:TextRubikRegular(
                            "Start Learning",
                            "left",
                            18.0,
                            Colors.white,
                            false),

                      ),

                      Image.asset("assets/images/learning_icon.png",width: 16,height: 16,)
                    /*  Icon(
                        Icons.import_contacts,
                        color: Colors.white,size: 22,
                      ),*/
                    ],
                  )),
            ),
          ],
        ),

      ),
    );
  }
}

