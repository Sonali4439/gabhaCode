
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/screens/registration/registrationCommanForm.dart';
import 'package:gabha_app1/screens/registration/welcomeScreen.dart';
import 'package:gabha_app1/screens/registration/wrapper/RequestUserLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseLogin.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomElevatedButton.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/Core.dart';
import '../../core/SharedPrefrenceSessionManager.dart';

class ActivityOtpScreen extends StatefulWidget {
  String mobileNum;
  ActivityOtpScreen({required this.mobileNum});
 // const ActivityOtpScreen({Key? key}) : super(key: key);

  @override
  State<ActivityOtpScreen> createState() => _ActivityOtpScreenState();
}

class _ActivityOtpScreenState extends State<ActivityOtpScreen> {
  AppColors appColors = AppColors();
  final _formKey = GlobalKey<FormState>();
  bool textFieldFilled = false;
  bool isButtonEnabled = false;
  bool? errorMobile = false;
  String? errorTextMobile = "";

  TextEditingController otpController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Core core = Core();
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  final defaultPinTheme = PinTheme(
    width: 40,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF00A36D), width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  final errorPinTheme = PinTheme(
    width: 40,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFff0000), width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 40,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF00A36D), width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void loginUser() async {
    RequestUserLogin requestUserLogin = RequestUserLogin();
    requestUserLogin.mobileNo = "${widget.mobileNum}";
    requestUserLogin.otp=otpController.text;

    print(requestUserLogin.mobileNo);
    print(requestUserLogin.otp);

    Response<ResponseLogin> response = await core.loginUser(requestUserLogin);
    print(response);
    print("----------------------");
      print(response.body?.status?.statusCode);
      print("33333333333333333333");

    if (response.body?.status?.statusCode == 0) {
      print("login sucesss--------------");
      SharedPreferences pref = await _prefs;
      pref.setString("gabha_token", jsonEncode("${response.body?.payload?.token}")).then((value) => print('User Login Value Saved : $value'));
      print("${response.body?.payload?.token}");
      print("@@@@@@@@@@@@@@@@");

      if(response.body?.getPayload()?.userList != null) {
        if(response.body?.payload!.userList!.isParent == false){
          //nrml user
          //save data
          //show welcome screen
          //home screen

          PreferenceUtils.init();
          PreferenceUtils.setString("gabha_token","${response.body?.payload?.token}");
          PreferenceUtils.setString("gabha_user_id","${response.body?.payload?.userList!.id}");
          PreferenceUtils.setString("gabha_user_name","${response.body?.payload?.userList!.useName}");

          Navigator.push(context,
                   MaterialPageRoute(
                     builder: (context) => WelcomeScreen(),
                  ),
            );

        //  PreferenceUtils.setString("gabha_user_grade_id","${response.body?.payload?.userList!.grade!.id}");
        //  PreferenceUtils.setString("gabha_user_board_id","${response.body?.payload?.userList!.grade!.board!.id}");
        } else {
          //parent user

          //if length > 1
          // show child list screen
          //click on item
          //save data
          // dashboard

          //if only 1 child
          //show welcome screen
          //dashboard





        }

        Future.delayed(const Duration(seconds: 1), () async {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        });



        // response.body?.payload!.userList!.childList!.asMap().forEach((key,
        //     value) async {
        //   core.updateSession(response.body
        //       ?.getPayload()
        //       ?.token, response.body
        //       ?.getPayload()
        //       ?.userList);
        //
        //   Navigator.push(context,
        //     MaterialPageRoute(
        //       builder: (context) => WelcomeScreen(),
        //     ),
        //   );
        // });
      }
      // if(response.body?.getPayload()?.userList! != null){
      //   response.body?.payload!.userList!.childList!.asMap().forEach((key, value) async {
      //
      //     pref.setString("child_name", jsonEncode("${response.body?.payload?.userList!.childList!.elementAt(key).child!.childName}")).then((value) => print('User Login Value Saved : $value'));
      //     print("${response.body?.payload?.token}");
      //
      //     core.updateSession(response.body?.getPayload()?.token, response.body?.getPayload()?.userList);
      //
      //     Navigator.push(context,
      //       MaterialPageRoute(
      //         builder: (context) => WelcomeScreen(),
      //       ),
      //     );
      //   });
      //
      //
      //
      //
      // }

    }else if (response.body?.status?.statusCode == 1) {
      print("faillll");

        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => const RegistrationCommanForm(),
          ),
        );


    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //otp text
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextRubikRegular("OTP", "left", 22.0,
                            appColors.mainHeadingColor, true),
                      ),

                      //hint text
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                        child: TextRubikRegular(
                            "Please enter the OTP recieved at  ${widget.mobileNum}",
                            "left",
                            18.0,
                            appColors.hintHeadingColor,
                            false),
                      ),

                      // otp text field
                      Center(
                        child: Pinput(
                          length: 4,
                          controller: otpController,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          errorPinTheme: errorPinTheme,
                          showCursor: true,
                          errorTextStyle: TextStyle(color: appColors.errorBorder),
                          separator: const SizedBox(
                            width: 10,
                          ),
                          onChanged: (text) {
                            if (text != "") {
                              textFieldFilled = true;
                              if (textFieldFilled) {
                                setState(() {
                                  isButtonEnabled = true;
                                });
                              }
                            } else {
                              textFieldFilled = false;
                              setState(() {
                                isButtonEnabled = false;
                              });
                            }
                          },
                          validator: (value) {
                            final error = value!.isEmpty
                                ? "Enter OTP Here"
                                : null;
                            return (error != null)
                                ? error
                                : value.length == 4
                                ? null
                                : "Enter 4 digit Mobile Number Here";

                            /*final error = value!.isEmpty
                                  ? "OTP required"
                                  : value.length != 4
                                      ? "Enter Complete OTP"
                                      : null;

                              return error;*/

                          },
                        ),
                      ),
                      /* Padding(
                          padding: const EdgeInsets.only(top: 6.0,left: 55),
                          child: TextRubikRegular(
                              errorMobile == true ? "$errorTextMobile" : "",
                              "left",
                              12.0,
                              errorMobile == true
                                  ? Colors.red
                                  : appColors.hintHeadingColor,
                              false),
                        ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
     /* Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: CustomElevatedButton(
            buttonText: 'Next',
            buttonTextFont: 18,
            buttonTextColour: Colors.white,
            buttonTextIsBold: false,
            onPressed: () {
              if (_formKey.currentState!.validate())  {
                loginUser();
              }
            },
            buttonColor: isButtonEnabled
                ? Colors.green :Colors.green.withOpacity(0.2),
            buttonBorderRadius: 10.0,
            buttonBorderRadiusColor: isButtonEnabled
                ? Colors.green :Colors.green.withOpacity(0.2),
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width*0.90,
            iconAlignment:"center",
            // buttonIconData: Icons.menu_book,
            buttonIconData: Icons.arrow_forward_ios,
            buttonIconColor: Colors.white,
            buttonIconSize: 16

        ),
      ),*/

      Padding(
        padding: const EdgeInsets.all(20),
        child: CustomTextButton(
          buttonColor: isButtonEnabled
              ? appColors.mainHeadingColor
              : appColors.containerBorderColor,
          onPressed: () {
            if (_formKey.currentState!.validate())  {
              loginUser();
            }
          },
          title: "Next",
          paddingSize: 15,
          iconName: const Icon(Icons.arrow_forward,color: Colors.white,size: 28,),
        ),
      )
      /*Padding(
          padding: const EdgeInsets.all(20),
          child: CustomTextButton(
            buttonColor: isButtonEnabled
                ? appColors.mainHeadingColor
                : appColors.mainHeadingColor.withOpacity(0.2),
            onPressed: () {
              if (_formKey.currentState!.validate())  {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityCommonFormScreen()),
                );
                *//* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ActivityWelocmeScreen()),
              );*//*
              }
            },
            title: "Next",
          ),
        )*/
    );
  }
/* bool isFormValid() {
    if (otpController.text.trim().isEmpty) {
      setState(() {
        errorMobile = true;
        errorTextMobile = "Enter mobile number";
        scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
      return false;
    }

    if (otpController.text.trim().length != 10) {
      setState(() {
        errorMobile = true;
        errorTextMobile = "Enter 10 digit mobile number";
        scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
      return false;
    }
    return true;
  }*/

}
