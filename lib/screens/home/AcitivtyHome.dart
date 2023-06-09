import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/screens/home/wrapper/ChildList.dart';
import 'package:gabha_app1/screens/home/wrapper/ResponseGetChild.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/Core.dart';
import '../model/childModel.dart';
import 'ActivityHomeLists.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({Key? key}) : super(key: key);

  @override
  State<ActivityHome> createState() => _ActivityHomeState();
}

class _ActivityHomeState extends State<ActivityHome> {
  AppColors appColors = AppColors();
  List<ChildModel> childData=[
    ChildModel( name: 'Atharva Rajesh Patil',standard: 'SSC',grade: '4th Grade',),
    ChildModel( name: 'Vedant Rajesh Patil',standard: 'SSC',grade: '4th Grade',),
  ];

  List<ChildList>? childList=[];

  Core core = Core();

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
                 // Navigator.pop(context);
                },
                child:ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset("assets/images/gabha_logo.png",height: 80,width:80)),
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextRubikRegular(
                        "Who’s learning ?",
                        "left",
                        18.0,appColors.hintHeadingColor,
                        false),
                  ),
                  ListView.builder(itemBuilder:  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivityHomeLists()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: appColors.mainHeadingColor),

                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child:Image.asset("assets/images/user_profile.png",width: 50,height: 50,)
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextRubikRegular(
                                            "${childList!.elementAt(index).child!.childName}",
                                              "left",
                                              18.0,appColors.hintHeadingColor,
                                              false),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                TextRubikRegular(
                                            ("${childList!.elementAt(index).grade}".length < 0)
                                                   ? "${childList!.elementAt(index).grade!.board!.boardShortName}"
                                                    :"",
                                                    "right",
                                                    14.0,appColors.subHeadingColor,
                                                    false),
                                                /* Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: TextRubikRegular(
                                                        "\u2022",
                                                        "right",
                                                        14.0,appColors.subTitleColorGreyLight,
                                                        true),
                                                  ),*/
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: TextRubikRegular(
                                                      ("${childList!.elementAt(index).grade}".length < 0)
                                                      ?"${childList!.elementAt(index).grade!.grade}" :"",
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


                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },

                      shrinkWrap: true,
                      itemCount: childList!.length),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

