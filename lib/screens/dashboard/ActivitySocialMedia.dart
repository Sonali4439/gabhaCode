import 'package:flutter/material.dart';
import 'package:gabha_app1/screens/model/socialMediaModel.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/childModel.dart';

class ActivitySocialMedia extends StatefulWidget {
  const ActivitySocialMedia({Key? key}) : super(key: key);

  @override
  State<ActivitySocialMedia> createState() => _ActivitySocialMediaState();
}

class _ActivitySocialMediaState extends State<ActivitySocialMedia> {
  AppColors appColors = AppColors();
  List<SocialModel> socialMediaData=[
    SocialModel( icon:"assets/images/gabha_logo.png",name: 'Gabha Website',url: 'visit',
        visitIcon: "assets/images/visit.png"),
    SocialModel( icon:"assets/images/instagram.png",name: 'Gabha Instagram',url: 'visit',
        visitIcon: "assets/images/visit.png"),
    SocialModel( icon:"assets/images/facebook.png",name: 'Gabha Facebook',url: 'visit',
        visitIcon: "assets/images/visit.png"),

  ];

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
                  padding: const EdgeInsets.only(left: 10,bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     /* Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back,color: appColors.hintHeadingColor, size: 20,),
                      ),*/
                      TextRubikRegular("Social Media",
                          "left", 20.0, appColors.hintHeadingColor, true),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(Icons.star,color: appColors.memberShipColor, size: 16,),
                          ),
                          TextRubikRegular("Rate Us",
                              "left", 14.0, appColors.hintHeadingColor, false),
                        ],
                      )

                    ],
                  ),
                ),
              ),






              Expanded(
                child: ListView.builder(itemBuilder:  (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("${socialMediaData[index].icon}",width: 69,height: 60,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 18,left: 20),
                                child: TextRubikRegular(
                                    "${socialMediaData[index].name}",
                                    "left",
                                    18.0,appColors.hintHeadingColor,
                                    false),
                              ),
                            ),

                            Column(
                              children: [
                                Image.asset("${socialMediaData[index].visitIcon}",width: 30,height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0,top: 2),
                                  child: TextRubikRegular(
                                    "${socialMediaData[index].url}",
                                    "left",
                                    12.0,
                                    appColors.hintHeadingColor,
                                    false,
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

                    itemCount: socialMediaData.length),
              )

            ],
          ),
        ),
      ),
    );
  }
}
