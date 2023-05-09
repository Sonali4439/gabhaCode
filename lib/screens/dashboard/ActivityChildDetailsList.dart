import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/screens/home/wrapper/ChildList.dart';
import 'package:gabha_app1/screens/home/wrapper/ResponseGetChild.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAddUserSubscription.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/childModel.dart';
import 'ActivityAddChild.dart';
import 'ActivityBuySubcription.dart';
import 'ActivitySubcriptionDetails.dart';

class ActivityChildDetailsList extends StatefulWidget {
  const ActivityChildDetailsList({Key? key}) : super(key: key);

  @override
  State<ActivityChildDetailsList> createState() => _ActivityChildDetailsListState();
}

class _ActivityChildDetailsListState extends State<ActivityChildDetailsList> {
  AppColors appColors = AppColors();
  List<ChildList>? childList=[];

  Core core = Core();
  String? childId;

  // List<ChildModel> childData=[
  //   ChildModel( name: 'Atharva Rajesh Patil',standard: 'SSC',grade: '4th Grade',
  //       subscribe: 'Subscribed',freeTrial: ''),
  //   ChildModel( name: 'Vedant Rajesh Patil',standard: 'SSC',grade: '4th Grade',
  //       subscribe: 'Buy Subscription',freeTrial: 'Free Trial'),
  // ];

  @override
  void initState() {
    super.initState();
    onResume();
  }
  void onResume(){
    getChildUserList();
  }

  void getChildUserList() async {
    Response<ResponseGetChild> response = await core.getChildUserList();
    if (response.body?.status?.statusCode == 0) {

      response.body?.payload!.childList!.asMap().forEach((key, value) async {
        Response<ResponseAddUserSubscription> responseChild = await core.getSubscriptionByUser("${value.child!.childId}");
        setState(() {
          response.body?.payload!.childList!.elementAt(key).child!.userSubscription = responseChild.body?.payload;
        });
      });

      setState(() {
        childList =   response.body?.payload!.childList;
      });


    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
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

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityAddChild()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.add,color: appColors.addChildColor, size: 20,),
                      ),
                      TextRubikRegular("Add Child",
                          "left", 18.0, appColors.addChildColor, false),
                    ],
                  ),
                ),
              ),




              Expanded(
                child: ListView.separated(itemBuilder:  (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      if("${childList!.elementAt(index).child!.userSubscription!.subscriptions!.subscriptionType!.type}"=="Free trial")
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActivityBuySubcription(childList:childList!.elementAt(index))));
                        }else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivitySubcriptionDetails(childList:childList!.elementAt(index))));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child:Image.asset("assets/images/user_profile.png",)
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextRubikRegular("${childList!.elementAt(index).child!.childName}",
                                        // childList!
                                          "left",
                                          18.0,appColors.hintHeadingColor,
                                          false),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: [
                                            if("${childList!.elementAt(index).child!.userSubscription}" !="null")
                                            TextRubikRegular(
                                                "${childList!.elementAt(index).child!.userSubscription!.subscriptions!.academicYear!.grade!.board!.boardShortName}",
                                                // "${childData[index].standard}",
                                                "right",
                                                14.0,appColors.subHeadingColor,
                                                false),

                                            if("${childList!.elementAt(index).child!.userSubscription}" !="null")
                                              Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: TextRubikRegular(
                                                  "${childList!.elementAt(index).child!.userSubscription!.subscriptions!.academicYear!.grade!.grade} Grade",
                                                  "right",
                                                  14.0,appColors.subHeadingColor,
                                                  false),
                                            ),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child:
                                      ("${childList!.elementAt(index).child!.userSubscription}" !="null")
                                   ? TextRubikRegular(
                                          ( "${childList!.elementAt(index).child!.userSubscription!.subscriptions!.subscriptionType!.type}"=="Free trial")
                                     ? "${childList!.elementAt(index).child!.userSubscription!.subscriptions!.subscriptionType!.type}" :"Subscribed",
                                      "left",
                                      16.0,
                                      "${childList!.elementAt(index).child!.userSubscription!.subscriptions!.subscriptionType!.type}"=="Free trial"
                                     ? appColors.hintHeadingColor :appColors.mainHeadingColor,
                                      false,
                                    ):TextRubikRegular(
                                        "",
                                        "left",
                                        16.0,
                                        appColors.mainHeadingColor,
                                        false,
                                      ),
                                  ),

                                 if ("${childList!.elementAt(index).child!.userSubscription}" !="null")
                                  if("${childList!.elementAt(index).child!.userSubscription!.subscriptions!.subscriptionType!.type}"=="Free trial")
                                   TextRubikRegular(
                                     "Buy Subscription",
                                     "left",
                                   16.0,
                                     appColors.addChildColor,
                                    false,
                                   ),

                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: childList!.length),
              )

            ],
          ),
        ),
      ),
    );
  }
}
