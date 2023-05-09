import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gabha_app1/constant/AppColors.dart';
import 'package:gabha_app1/screens/dashboard/ActivityBuySubcription.dart';
import 'package:gabha_app1/screens/dashboard/ActivityChildBuySubcription.dart';
import 'package:gabha_app1/screens/dashboard/ActivityChildSubcriptionDetails.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAddUserSubscription.dart';

import '../../constant/TextRubikRegular.dart';
import '../../core/Core.dart';
import '../../core/SharedPrefrenceSessionManager.dart';
import '../registration/splashScreen.dart';
import 'ActivityChildDetailsList.dart';
import 'ActivityEditChildProfile.dart';
import 'ActivityEditParentProfile.dart';
import 'ActivityModeOfCommunication.dart';

class ActivityProfile extends StatefulWidget {
  const ActivityProfile({Key? key}) : super(key: key);

  @override
  State<ActivityProfile> createState() => _ActivityProfileState();
}

class _ActivityProfileState extends State<ActivityProfile> {
  Core core = Core();
  AppColors appColors=AppColors();
  @override
  void initState() {
    super.initState();
    print('--------${PreferenceUtils.getString("gabha_token")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    print('----email----${PreferenceUtils.getString("gabha_email")}');
    print('----mobile----${PreferenceUtils.getString("gabha_mobile")}');
    print('----isParent----${PreferenceUtils.getString("gabha_isParent")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    print('---userid-----${PreferenceUtils.getString("gabha_user_id")}');

    onResume();
  }


  void onResume(){
    getChildSubscription();
  }

  void getChildSubscription() async {
    Response<ResponseAddUserSubscription> responseChild = await core.getSubscriptionByUser("${PreferenceUtils.getString("gabha_user_id")}");
    setState(() {
      PreferenceUtils.init();
      PreferenceUtils.setString("subscription_type", "${responseChild.body?.payload?.subscriptions!.subscriptionType!.type}");
      PreferenceUtils.setString("subscription_start_date", "${responseChild.body?.payload?.buySubscriptionDate}");
      PreferenceUtils.setString("subscription_end_date", "${responseChild.body?.payload?.endSubscriptionDate}");
      PreferenceUtils.setString("academic_start_date", "${responseChild.body?.payload?.subscriptions!.academicYear!.startAcademicDate}");
      PreferenceUtils.setString("academic_end_date", "${responseChild.body?.payload?.subscriptions!.academicYear!.endAcademicDate}");

    });
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("-----type-------------${PreferenceUtils.getString("subscription_type")}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25,20,25,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRubikRegular("Profile",
                "left", 24.0, appColors.hintHeadingColor, true),

                Padding(
                  padding: const EdgeInsets.only(top: 40,bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:Image.asset("assets/images/user_profile.png",)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Row(
                                children: [
                                  TextRubikRegular(/*"Rajesh Shekar Patil"*/
                                    "${PreferenceUtils.getString("gabha_user_name")}".isNotEmpty
                                      ? "${PreferenceUtils.getString("gabha_user_name")}"
                                    :"",
                                      "left", 18.0, appColors.hintHeadingColor, false),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: TextRubikRegular(/*"Parent",*/
                                        "${PreferenceUtils.getString("gabha_isParent")}" =="true"
                                            ? "Parent"
                                            :"Child",
                                        "left", 18.0, appColors.mainHeadingColor, false),
                                  ),
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Row(
                                children: [
                                  TextRubikRegular(/*"75062304745",*/
                                      "${PreferenceUtils.getString("gabha_mobile")}".isNotEmpty
                                          ? "${PreferenceUtils.getString("gabha_mobile")}"
                                          :"",
                                      "left", 14.0, appColors.textFieldHintColor, false),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextRubikRegular(/*"rajesh@gmail.com",*/
                                        "${PreferenceUtils.getString("gabha_email")}".isNotEmpty
                                            ? "${PreferenceUtils.getString("gabha_email")}"
                                            :"",
                                        "left", 14.0, appColors.textFieldHintColor, false),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                if("${PreferenceUtils.getString("gabha_isParent")}" =="true")
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ActivityEditParentProfile()));
                                  }
                                else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityEditChildProfile()));
                                }
                               /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => ActivityEditParentProfile()));*/
                              /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActivityEditChildProfile()));*/

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Row(
                                  children: [
                                    Icon(Icons.edit,color: appColors.addChildColor, size: 20,),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: TextRubikRegular("Edit Profile",
                                          "left", 16.0, appColors.addChildColor, false),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //pages ui
               ("${PreferenceUtils.getString("gabha_isParent")}" =="true")
               ? GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityChildDetailsList()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.person,color: appColors.mainHeadingColor, size: 20,),
                        ),
                        Expanded(
                          child: TextRubikRegular("Child Details",
                              "left", 16.0, appColors.hintHeadingColor, false),
                        ),
                        Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                      ],
                    ),
                  ),
                )
               :GestureDetector(
                 onTap: (){
                  if("${PreferenceUtils.getString("subscription_type")}"=="Free trial")
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityChildBuySubscription()));
                    }
                  else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityChildSubcriptionDetails()));
                  }

                  /* Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => ActivityChildDetailsList()));*/
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(top: 30),
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: Icon(Icons.person,color: appColors.mainHeadingColor, size: 20,),
                       ),
                       Expanded(
                         child: TextRubikRegular("Subscription Details",
                             "left", 16.0, appColors.hintHeadingColor, false),
                       ),
                       Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                     ],
                   ),
                 ),
               ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityModeOfCommunication()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child:Image.asset("assets/images/social.png", width: 22, height: 22,)
                         /* Icon(Icons.person,color: appColors.mainHeadingColor, size: 20,),*/
                        ),
                        Expanded(
                          child: TextRubikRegular("Mode of communication",
                              "left", 16.0, appColors.hintHeadingColor, false),
                        ),
                        Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          "assets/svgs/terms.svg",width: 20,height: 20,color: appColors.mainHeadingColor,
                        ),
                        /* Icon(Icons.terminal_sharp,color: appColors.mainHeadingColor, size: 20,),*/
                      ),
                      Expanded(
                        child: TextRubikRegular("Terms & Conditions",
                            "left", 16.0, appColors.hintHeadingColor, false),
                      ),
                      Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child:SvgPicture.asset(
                          "assets/svgs/privacy.svg",width: 20,height: 20,color: appColors.mainHeadingColor,
                        ),
                        /* Icon(Icons.person,color: appColors.mainHeadingColor, size: 20,),*/
                      ),
                      Expanded(
                        child: TextRubikRegular("Privacy Policy",
                            "left", 16.0, appColors.hintHeadingColor, false),
                      ),
                      Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child:SvgPicture.asset(
                          "assets/svgs/disclaimer.svg",width: 20,height: 20,color: appColors.mainHeadingColor,
                        ),
                        /* Icon(Icons.person,color: appColors.mainHeadingColor, size: 20,),*/
                      ),
                      Expanded(
                        child: TextRubikRegular("Disclaimer",
                            "left", 16.0, appColors.hintHeadingColor, false),
                      ),
                      Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    core.logout();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child:/*Image.asset("assets/images/social.png", width: 20,)*/
                          Icon(Icons.logout,color: appColors.mainHeadingColor, size: 20,),
                        ),
                        Expanded(
                          child: TextRubikRegular("Logout",
                              "left", 16.0, appColors.hintHeadingColor, false),
                        ),
                        Icon(Icons.arrow_forward_ios,color: appColors.mainHeadingColor, size: 20,),
                      ],
                    ),
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
