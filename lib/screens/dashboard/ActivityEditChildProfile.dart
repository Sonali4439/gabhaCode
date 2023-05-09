import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';

class ActivityEditChildProfile extends StatefulWidget {
  const ActivityEditChildProfile({Key? key}) : super(key: key);

  @override
  State<ActivityEditChildProfile> createState() => _ActivityEditChildProfileState();
}

class _ActivityEditChildProfileState extends State<ActivityEditChildProfile> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent=true;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobileNum = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  List<String> _board = ['SSC', 'CBSC', 'ICSC', 'IB'];
  String? _selectedBoard;

  List<String> _classNum = ['1st', '2nd', '3rd', '4th'];
  String? _selectedClassNum;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.arrow_back,color: appColors.hintHeadingColor, size: 20,),
                          ),
                          TextRubikRegular("Edit Profile",
                              "left", 18.0, appColors.hintHeadingColor, false),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child:Image.asset("assets/images/user_profile.png",)
                      ),
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
                    padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: TextRubikRegular("Board", "left", 16.0,
                        appColors.hintHeadingColor, false),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 20,right: 20),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.errorBorder),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      iconEnabledColor: appColors.mainHeadingColor,
                      hint: Text(
                        'What board does the school comes under ?',
                        style: TextStyle(
                            color: appColors.hintHeadingColor, fontSize: 15),
                      ),
                      value: _selectedBoard,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedBoard = newValue;
                        });
                      },
                      items: _board.map((board) {
                        return DropdownMenuItem(
                          child: new Text(board),
                          value: board,
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) return "Please select board";
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: TextRubikRegular("Class/ Standard/ Grade", "left",
                        16.0, appColors.hintHeadingColor, false),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 20,right: 20),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor),
                            borderRadius: BorderRadius.circular(5)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.errorBorder),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      iconEnabledColor: appColors.mainHeadingColor,
                      hint: Text(
                        'What class does your child studies in ?',
                        style: TextStyle(
                            color: appColors.hintHeadingColor, fontSize: 15),
                      ),
                      value: _selectedClassNum,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedClassNum = newValue;
                        });
                      },
                      items: _classNum.map((classnum) {
                        return DropdownMenuItem(
                          child: new Text(classnum),
                          value: classnum,
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) return "Please select class";
                        return null;
                      },
                    ),
                  ),







                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar:
      Padding(
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child:TextRubikRegular(
                            "Save ",
                            "left",
                            18.0,
                            Colors.white,
                            false),

                      ),

                    ],
                  )),
            ),
          ],
        ),

      ),





    );
  }
}



