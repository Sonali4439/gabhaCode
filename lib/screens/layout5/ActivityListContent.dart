import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelsModel.dart';

class ActivityListContent extends StatefulWidget {
  const ActivityListContent({Key? key}) : super(key: key);

  @override
  State<ActivityListContent> createState() => _ActivityListContentState();
}

class _ActivityListContentState extends State<ActivityListContent> {
  AppColors appColors = AppColors();
  List<VowelsModel> vowelsData=[
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
    VowelsModel( name: 'स् + त = स्त (मस्त) ',),
  ];
  @override
  Widget build(BuildContext context) {
    print("44444444444444444444444444");
    return Scaffold(
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
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back,color: appColors.hintHeadingColor, size: 20,),
                      ),
                      TextRubikRegular("Go back",
                          "left", 18.0, appColors.hintHeadingColor, false),

                    ],
                  ),
                ),
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextRubikRegular("जोडाक्षर ",
                      "left", 32.0, appColors.hintHeadingColor, false),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2,bottom: 70),
                  child: TextRubikRegular("Compound Words ",
                      "left", 16.0, appColors.hintHeadingColor, false),
                ),
              ),



              Expanded(
                child: ListView.separated(itemBuilder:  (BuildContext context, int index) {
                  print("Listttttttttttttt");
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: TextRubikRegular(
                                                "1)",
                                                "left",
                                                18.0,appColors.hintHeadingColor,
                                                false),
                                          ),
                                          TextRubikRegular(
                                              "${vowelsData[index].name}",
                                              "left",
                                              18.0,appColors.hintHeadingColor,
                                              false),
                                        ],
                                      ),


                                      Image.asset("assets/images/sound_circle.png",width: 30,height: 30,)

                                    ],
                                  ),
                                ),
                              ),


                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                    separatorBuilder: (BuildContext context, int index) =>  Divider(color: appColors.hintHeadingColor,),
                    itemCount: vowelsData.length),
              )

            ],
          ),
        ),
      ),
    );
  }
}


