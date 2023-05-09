import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gabha_app1/screens/registration/studentRegistrationForm.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomElevatedButton.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';

class RegistrationCommanForm extends StatefulWidget {
  const RegistrationCommanForm({Key? key}) : super(key: key);

  @override
  State<RegistrationCommanForm> createState() => _RegistrationCommanFormState();
}

class _RegistrationCommanFormState extends State<RegistrationCommanForm> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobileNum = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //progress bar
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: LinearPercentIndicator(
                        // width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2000,
                        percent: 0.3,
                        backgroundColor: appColors.progressColor,
                        barRadius: const Radius.circular(16),
                        progressColor: appColors.mainHeadingColor,
                      ),
                    ),

                    // Hey there text
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: TextRubikRegular("Hey there !", "left", 22.0,
                            appColors.mainHeadingColor, true),
                      ),
                    ),

                    //hint text
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: TextRubikRegular("Please fill your details",
                            "left", 18.0, appColors.hintHeadingColor, false),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 40, left: 15, right: 15),
                      child: CustomFieldBox(
                          label: "Full Name",
                          inputValue: "Enter Your Full Name",
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Full Name Here";
                            }
                            return null;
                          },
                          onChanged: (value) {}),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 25, left: 15, right: 15),
                      child: CustomFieldBox(
                          label: "Mobile Number",
                          inputValue: "Enter Mobile Number",
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerMobileNum,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value) {
                            final regExp =  RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                            final error = value!.isEmpty
                                ? "Enter Mobile Number Here"
                                : null;
                            return (error != null)
                                ? error
                                : regExp.hasMatch(value)
                                ? null
                                : "Enter 10 digit Mobile Number Here";
                          },
                          onChanged: (value) {}),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 25, left: 15, right: 15),
                      child: CustomFieldBox(
                          label: "Email ID",
                          inputValue: "Enter Your Email ID",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerEmail,
                          validator: (value) {
                            final emailRegex = RegExp(
                              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                            );
                            final error = value!.isEmpty
                                ? "Enter Your Email ID here"
                                : null;
                            return (error != null)
                                ? error
                                : emailRegex.hasMatch(value)
                                ? null
                                : "Invalid email";
                          },
                          onChanged: (value) {}),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 40, left: 15, right: 15),
                      child: TextRubikRegular("Mode of communication", "left",
                          18.0, appColors.hintHeadingColor, false),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                      child: TextRubikRegular(
                          "We did like to send you updates related to your subscription, childs progress, etc.",
                          "left",
                          14.0,
                          appColors.subHeadingColor,
                          false),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: "WhatsApp",
                                    activeColor: appColors.mainHeadingColor,
                                    groupValue: mediaValue,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      setState(() {
                                        mediaValue = value.toString();
                                      });
                                    }),
                                TextRubikRegular("WhatsApp", "left", 18.0,
                                    appColors.hintHeadingColor, false),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: "Email",
                                    activeColor: appColors.mainHeadingColor,
                                    groupValue: mediaValue,
                                    onChanged: (value) {
                                      setState(() {
                                        mediaValue = value.toString();
                                      }); //selected value
                                    }),
                                TextRubikRegular("Email", "left", 18.0,
                                    appColors.hintHeadingColor, false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: TextRubikRegular("I am a ", "left", 18.0,
                          appColors.hintHeadingColor, false),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: false,
                                    activeColor: appColors.mainHeadingColor,
                                    groupValue: isParent,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      setState(() {
                                        isParent = value;
                                      });
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: TextRubikRegular("Student", "left", 18.0,
                                      appColors.hintHeadingColor, false),
                                ),
                                Icon(
                                  Icons.person,
                                  color: appColors.mainHeadingColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: true,
                                    groupValue: isParent,
                                    activeColor: appColors.mainHeadingColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isParent = value;
                                      }); //selected value
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: TextRubikRegular("Parent", "left", 18.0,
                                      appColors.hintHeadingColor, false),
                                ),
                                Image.asset(
                                  "assets/images/parent_icon.png",
                                  height: 22,
                                  width: 22,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
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
                if (formKey.currentState!.validate()) {
                  if (mediaValue == null) {
                    Fluttertoast.showToast(
                        msg: "Please select mode of communication",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16.0);
                  }
                  if (iAm == null) {
                    Fluttertoast.showToast(
                        msg: "Please select student or parent",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16.0);
                  } else if (iAm == "Student") {
                   *//* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentInfoFormScreen()),
                    );*//*
                  } else if (iAm == "Parent") {
                  *//*  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParentInfoFormScreen()),
                    );*//*
                  }
                }
              },
              buttonColor:
              Colors.green,
              buttonBorderRadius: 10.0,
              buttonBorderRadiusColor:  Colors.green ,
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
            buttonColor: appColors.mainHeadingColor,

            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (mediaValue == null) {
                  Fluttertoast.showToast(
                      msg: "Please select mode of communication",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 16.0);
                }else if (isParent == null) {
                  Fluttertoast.showToast(
                      msg: "Please select student or parent",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 16.0);
                }else{

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentRegistrationForm(
                            fullName:controllerName.text, mobile:controllerMobileNum.text,
                          email:controllerEmail.text, modeOfCommunication:mediaValue.toString(),
                          isParents: isParent,
                        )),
                  );
                }



                /*else if (iAm == "Student") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentRegistrationForm()),
                  );
                } else if (iAm == "Parent") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParentInfoFormScreen()),
                  );
                }*/
              }
            },
            title: "Next",
            paddingSize: 15,
            iconName: Icon(Icons.arrow_forward,color: Colors.white,size: 28,),
          ),
        ),

        /*bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (mediaValue == null) {
                    Fluttertoast.showToast(
                        msg: "Please select mode of communication",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16.0);
                  }
                  if (iAm == null) {
                    Fluttertoast.showToast(
                        msg: "Please select student or parent",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        fontSize: 16.0);
                  } else if (iAm == "Student") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentInfoFormScreen()),
                    );
                  } else if (iAm == "Parent") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParentInfoFormScreen()),
                    );
                  }
                }
              },
              child: ButtonFilledGreen(
                  MediaQuery.of(context).size.width, 50, "Save & Proceed")),
        ),*/
      ),
    );
  }
}

