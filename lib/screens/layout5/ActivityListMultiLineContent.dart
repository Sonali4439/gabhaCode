import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelsModel.dart';

class ActivityListMultiLineContent extends StatefulWidget {
  const ActivityListMultiLineContent({Key? key}) : super(key: key);

  @override
  State<ActivityListMultiLineContent> createState() => _ActivityListMultiLineContentState();
}

class _ActivityListMultiLineContentState extends State<ActivityListMultiLineContent> {
  AppColors appColors = AppColors();
  List<VowelsModel> vowelsData=[
    VowelsModel( name: "देव तारी त्याला कोण मारी.", name2:"अर्थ - ज्याचे रक्षण देव करतो त्याला कोणीही मारू शकत नाही."),
    VowelsModel( name: "देव तारी त्याला कोण मारी.", name2:"अर्थ - ज्याचे रक्षण देव करतो त्याला कोणीही मारू शकत नाही."),
    VowelsModel( name: "देव तारी त्याला कोण मारी.", name2:"अर्थ - ज्याचे रक्षण देव करतो त्याला कोणीही मारू शकत नाही."),
    VowelsModel( name: "देव तारी त्याला कोण मारी.", name2:"अर्थ - ज्याचे रक्षण देव करतो त्याला कोणीही मारू शकत नाही."),

    VowelsModel( name: "देव तारी त्याला कोण मारी.", name2:"अर्थ - ज्याचे रक्षण देव करतो त्याला कोणीही मारू शकत नाही."),


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
                  padding: const EdgeInsets.only(top: 20,bottom: 50),
                  child: TextRubikRegular("म्हणी ",
                      "left", 32.0, appColors.hintHeadingColor, false),
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
                                  child: Column(
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
                                          SizedBox(
                                            width: 250,
                                            child: TextRubikRegular(
                                                "${vowelsData[index].name}",
                                                "left",
                                                18.0,appColors.hintHeadingColor,
                                                false),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: 250,
                                              child: TextRubikRegular(
                                                  "${vowelsData[index].name2}",
                                                  "left",
                                                  18.0,appColors.hintHeadingColor,
                                                  false),
                                            ),
                                          ),
                                          Image.asset("assets/images/sound_circle.png",width: 30,height: 30,)

                                        ],
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



