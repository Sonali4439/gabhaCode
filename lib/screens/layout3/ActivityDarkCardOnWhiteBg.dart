import 'package:flutter/material.dart';
import 'package:gabha_app1/screens/layout3/ActivityDarkCardOnWhiteBgDetails.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelModel.dart';

class ActivityDarkCardOnWhiteBg extends StatefulWidget {
  String name;
  ActivityDarkCardOnWhiteBg({super.key, required this.name});
  //const ActivityDarkCardOnWhiteBg({Key? key}) : super(key: key);

  @override
  State<ActivityDarkCardOnWhiteBg> createState() => _ActivityDarkCardOnWhiteBgState();
}

class _ActivityDarkCardOnWhiteBgState extends State<ActivityDarkCardOnWhiteBg> {
  AppColors appColors = AppColors();
  List<VowelDetailsModel> vowelDetailsModel=[
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क '),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क '),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क '),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क ',),
    VowelDetailsModel( vowelName: 'क '),
    VowelDetailsModel( vowelName: 'क ',),




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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Icon(Icons.arrow_back,color:appColors.hintHeadingColor, size: 20,),
                          ),
                          TextRubikRegular("Go back",
                              "left", 18.0, appColors.hintHeadingColor, false),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Image.asset("assets/images/sound_black.png",width: 20,height: 20,),
                      ),
                      TextRubikRegular("Click on the letters for sound",
                          "left", 12.0, appColors.hintHeadingColor, false),
                    ],
                  )
                ],
              ),

              //vowel

            /*  Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: TextRubikRegular(widget.name,
                      "left", 24.0, appColors.hintHeadingColor, true),
                ),
              ),*/

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: TextRubikRegular("बाराखडी",
                      "left", 24.0, appColors.hintHeadingColor, false),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: TextRubikRegular("बाराखडी शिकण्यासाठी अक्षर निव्हडा ",
                      "left", 16.0, appColors.subHeadingColor, false),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 2,bottom: 40),
                child: Center(
                  child: TextRubikRegular("Choose a letter to learn",
                      "left", 16.0, appColors.subHeadingColor, false),
                ),
              ),


              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(vowelDetailsModel.length, (index) {
                    return Center(
                        child:GestureDetector(
                          onTap: (){
                          print("aaaaaaqqqqqqqqqqqqaaaaa");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActivityDarkCardOnWhiteBgDetails()));

                          },

                          child: Card(
                              color: appColors.mainHeadingColor,
                              child: Center(child: TextRubikRegular(
                                  "${vowelDetailsModel[index].vowelName}",
                                  "left",
                                  30.0,Colors.white,
                                  false),
                              )
                          ),
                        ));
                  }
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

