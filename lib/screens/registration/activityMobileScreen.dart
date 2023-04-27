import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomElevatedButton.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/TextRubikRegular.dart';
import 'activityOtpScreen.dart';

class ActivityMobileScreen extends StatefulWidget {
  const ActivityMobileScreen({Key? key}) : super(key: key);

  @override
  State<ActivityMobileScreen> createState() => _ActivityMobileScreenState();
}

class _ActivityMobileScreenState extends State<ActivityMobileScreen> {
  AppColors appColors = new AppColors();
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerMobile = TextEditingController();

  bool? errorMobile = false;
  String? errorTextMobile = "";

  ScrollController scrollController = ScrollController();

  bool textFieldFilled = false;
  bool isButtonEnabled = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child:
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //mobile text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                  child: TextRubikRegular("Mobile Number", "left", 22.0,
                      appColors.mainHeadingColor, true),
                ),

                //hint text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 30),
                  child: TextRubikRegular("Please enter your mobile no. ",
                      "left", 18.0, appColors.subHeadingColor, false),
                ),

                // mobile text field

                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: errorMobile == false
                              ? appColors.mainHeadingColor
                              : Colors.red),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextRubikRegular("+91", "left", 18.0,
                            appColors.hintHeadingColor, false),
                      ),
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        indent: 0,
                        color:  errorMobile == false
                            ? appColors.mainHeadingColor
                            : Colors.red,
                      ),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          controller: controllerMobile,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              color: appColors.hintHeadingColor,
                              fontFamily: "Rubik-regular",
                              fontSize: 16),
                          /*onFieldSubmitted: (mob) {
                              setState(() {
                                isTextFiledFocus = true;
                              });
                            },*/
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
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
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0,left: 55),
                  child: TextRubikRegular(
                      errorMobile == true ? "$errorTextMobile" : "",
                      "left",
                      12.0,
                      errorMobile == true
                          ? Colors.red
                          : appColors.hintHeadingColor,
                      false),
                ),
              ],
            ),
          )

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
              if (isFormValid()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityOtpScreen(mobileNum: controllerMobile.text)),
                );
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
              if (isFormValid()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityOtpScreen(mobileNum: controllerMobile.text)),
                );
              }
            },
            title: "Next",
            paddingSize: 15,
            iconName: Icon(Icons.arrow_forward,color: Colors.white,size: 28,),
          ),
        )
    );
  }

  bool isFormValid() {
    if (controllerMobile.text.trim().isEmpty) {
      setState(() {
        errorMobile = true;
        errorTextMobile = "Enter mobile number";
        scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
      return false;
    }

    if (controllerMobile.text.trim().length != 10) {
      setState(() {
        errorMobile = true;
        errorTextMobile = "Enter 10 digit mobile number";
        scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
      return false;
    }
    return true;
  }
}
