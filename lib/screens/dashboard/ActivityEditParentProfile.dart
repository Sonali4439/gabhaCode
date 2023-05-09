import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/SharedPrefrenceSessionManager.dart';
import 'package:gabha_app1/screens/dashboard/DashboardScreen.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestUserUpdate.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';

class ActivityEditParentProfile extends StatefulWidget {
  const ActivityEditParentProfile({Key? key}) : super(key: key);

  @override
  State<ActivityEditParentProfile> createState() => _ActivityEditParentProfileState();
}

class _ActivityEditParentProfileState extends State<ActivityEditParentProfile> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent=true;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobileNum = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();


  final formKey = GlobalKey<FormState>();
  Core core = Core();


  @override
  void initState() {
    super.initState();
    controllerName.text="${PreferenceUtils.getString("gabha_user_name")}";
    controllerMobileNum.text="${PreferenceUtils.getString("gabha_mobile")}";
    controllerEmail.text="${PreferenceUtils.getString("gabha_email")}";
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    print('----userid----${PreferenceUtils.getString("gabha_user_id")}');

  /*  print('--------${PreferenceUtils.getString("gabha_token")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    print('----email----${PreferenceUtils.getString("gabha_email")}');
    print('----mobile----${PreferenceUtils.getString("gabha_mobile")}');
    print('----isParent----${PreferenceUtils.getString("gabha_isParent")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');*/
  }

  void updateUser() async {
    RequestUserUpdate requestUserUpdate = RequestUserUpdate();
    requestUserUpdate.userId = "${PreferenceUtils.getString("gabha_user_id")}";
    requestUserUpdate.userName =controllerName.text;
    requestUserUpdate.mobileNo = controllerMobileNum.text;
    requestUserUpdate.email = controllerEmail.text;
    requestUserUpdate.modeOfCommunication = "${PreferenceUtils.getString("gabha_modeOfCommunication")}";


    print(requestUserUpdate.userName);
    print(requestUserUpdate.mobileNo);
    print(requestUserUpdate.email);
    print(requestUserUpdate.userId);


    Response<ResponseLogin> response = await core.updateUser(requestUserUpdate);
    print(response);

    if (response.body?.status?.statusCode == 0) {
      setState(() {
        print("update successfulllyyyyyyyyyyyyy");
       /* if(response.body?.getPayload()?.userList !=null)
          {
            core.updateSession(response.body?.getPayload()?.token, response.body?.getPayload()?.userList);
          }*/


       /* PreferenceUtils.init();
        PreferenceUtils.setString("gabha_user_name", "${response.body?.payload?.userList?.useName}");
        print("%%%%%%%%%%---------");*/

      /*  print("${PreferenceUtils.getString("gabha_user_name")}");
        print("%%%%%%%%%%%%%%%%%%");*/

        debugPrint("${response.body?.payload?.userList}");
        print("^^^^^^^^^^^^^^^^^^");

        PreferenceUtils.init();
        PreferenceUtils.setString("gabha_user_name", "${response.body?.payload?.userList?.useName}");

          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DashboardScreen()),
        );


      });
    }
  }
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
                        inputValue: "Full Name",
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
                  onPressed: () {
                     if (formKey.currentState!.validate()) {
                          if (formKey.currentState!.validate()) {
                            updateUser();
                      }
                    }

                  },
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


