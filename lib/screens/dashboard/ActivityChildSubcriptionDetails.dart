import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/constant/AppColors.dart';
import 'package:gabha_app1/constant/CustomTextFieldWiget.dart';
import 'package:gabha_app1/constant/TextRubikRegular.dart';
import 'package:gabha_app1/core/Core.dart';

import '../../core/SharedPrefrenceSessionManager.dart';
import 'wrapper/RequestUserNameUpdate.dart';
import 'wrapper/ResponseUpdateUserName.dart';

class ActivityChildSubcriptionDetails extends StatefulWidget {
  const ActivityChildSubcriptionDetails({Key? key}) : super(key: key);

  @override
  State<ActivityChildSubcriptionDetails> createState() => _ActivityChildSubcriptionDetailsState();
}

class _ActivityChildSubcriptionDetailsState extends State<ActivityChildSubcriptionDetails> {
  AppColors appColors = AppColors();
  Core core=Core();
  bool isShowDialog =false;
  TextEditingController controllerName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerName.text="${PreferenceUtils.getString("gabha_user_name")}";

  }

  void updateUserName() async {
    RequestUserNameUpdate requestUserNameUpdate = RequestUserNameUpdate();
    requestUserNameUpdate.userId = "${PreferenceUtils.getString("gabha_user_id")}";
    requestUserNameUpdate.childName =controllerName.text;

    print(requestUserNameUpdate.userId);
    print(requestUserNameUpdate.childName);

    Response<ResponseUpdateUserName> response = await core.updateUserName(requestUserNameUpdate);

    if (response.body?.status?.statusCode == 0) {
      setState(() {
        PreferenceUtils.init();
        PreferenceUtils.setString("gabha_user_name", controllerName.text);
        isShowDialog = false;
        print("name updated");

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowDialog = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
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
                                TextRubikRegular("Childs Details",
                                    "left", 18.0, appColors.hintHeadingColor, false),

                              ],
                            ),
                          ),
                        ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:Image.asset("assets/images/user_profile.png",)
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextRubikRegular("Subscribed",
                                      "left", 16.0, appColors.mainHeadingColor, false),
                                ),
                                TextRubikRegular(
                                    "${core.convertServerDateToDateddmmyy("${PreferenceUtils.getString("subscription_start_date")}")} To ${core.convertServerDateToDateddmmyy("${PreferenceUtils.getString("subscription_end_date")}")}",
                                   /* "May 21 to May 22 2024",*/
                                    "left", 16.0, appColors.hintHeadingColor, false),
                              ],
                            ),
                          ),
                        ),






                        //hint text
                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 20),
                          child: TextRubikRegular("Full Name",
                              "left", 18.0, appColors.hintHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,left: 20),
                                child: TextRubikRegular(/*"Atharva Rajesh Patil",*/
                                    "${PreferenceUtils.getString("gabha_user_name")}",
                                    "left", 18.0, appColors.subHeadingColor, false),
                              ),
                              GestureDetector(
                                onTap: (){

                                  isShowDialog == true ?
                                  setState(() {
                                    isShowDialog = false;
                                  })
                                      :
                                  setState(() {
                                    isShowDialog = true;
                                  });

                                  /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityEditParentProfile()));*/
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit,color: appColors.addChildColor, size: 20,),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: TextRubikRegular("Edit Name",
                                            "left", 16.0, appColors.addChildColor, false),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 20),
                          child: TextRubikRegular("Board",
                              "left", 18.0, appColors.hintHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: TextRubikRegular(/*"CBSC",*/
                              "${PreferenceUtils.getString("board_name")}",
                              "left", 18.0, appColors.subHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 20),
                          child: TextRubikRegular("Grade",
                              "left", 18.0, appColors.hintHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: TextRubikRegular(/*"4th",*/
                              "${PreferenceUtils.getString("grade_name")}",
                              "left", 18.0, appColors.subHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 20),
                          child: TextRubikRegular("Subsciption Details",
                              "left", 18.0, appColors.hintHeadingColor, false),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: TextRubikRegular(/*"Annual Membership (1 year)",*/
                              "Annual Membership (${PreferenceUtils.getString("subscription_type")})",
                              "left", 18.0, appColors.subHeadingColor, false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: TextRubikRegular("Academic year  ${core.convertServerDateToDateddmmyy("${PreferenceUtils.getString("academic_start_date")}")} - ${core.convertServerDateToDateddmmyy("${PreferenceUtils.getString("academic_end_date")}")}",
                              "left", 18.0, appColors.subHeadingColor, false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: TextRubikRegular("Subscribed on ${core.convertServerDateToDateddmmyy("${PreferenceUtils.getString("subscription_start_date")}")}",
                              "left", 18.0, appColors.subHeadingColor, false),
                        ),



                      ],
                    ),
                  ),
                ),





                if(isShowDialog == true)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black26,
                    child: Container(
                      height: MediaQuery.of(context).size.height/2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //below card is your main card
                          Container(
                            // height: MediaQuery.of(context).size.height/2,
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft:  Radius.circular(30),),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 10, left: 15, right: 15,bottom: 10),
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
                                      const EdgeInsets.only(top: 10, left: 15, right: 15,bottom: 10),
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
                                              updateUserName();
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
                              )
                          ),
                        ],
                      )
                      ,
                    ),
                  ),











              ],
            ),
          ),
        ),




      ),
    );
  }
}




