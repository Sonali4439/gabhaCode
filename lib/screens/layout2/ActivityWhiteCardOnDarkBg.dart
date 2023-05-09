import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../layout3/ActivityDarkCardOnWhiteBg.dart';
import '../model/vowelModel.dart';
import 'ActivityWhiteCardOnDarkBgSlider.dart';

class ActivityWhiteCardOnDarkBg extends StatefulWidget {
  String name;
  ActivityWhiteCardOnDarkBg({super.key, required this.name});
 // const ActivityWhiteCardOnDarkBg({Key? key}) : super(key: key);

  @override
  State<ActivityWhiteCardOnDarkBg> createState() => _ActivityWhiteCardOnDarkBgState();
}

class _ActivityWhiteCardOnDarkBgState extends State<ActivityWhiteCardOnDarkBg> {
  AppColors appColors = AppColors();
  List<VowelDetailsModel> vowelDetailsModel=[
    VowelDetailsModel( vowelName: 'अ',),
    VowelDetailsModel( vowelName: 'आ'),
    VowelDetailsModel( vowelName: 'इ',),
    VowelDetailsModel( vowelName: 'ई '),
    VowelDetailsModel( vowelName: 'अ',),
    VowelDetailsModel( vowelName: 'आ'),
    VowelDetailsModel( vowelName: 'इ',),
    VowelDetailsModel( vowelName: 'ई '),
    VowelDetailsModel( vowelName: 'अ',),
    VowelDetailsModel( vowelName: 'आ'),
    VowelDetailsModel( vowelName: 'इ',),
    VowelDetailsModel( vowelName: 'ई '),
    VowelDetailsModel( vowelName: 'अ',),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.mainHeadingColor,
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
                            child: Icon(Icons.arrow_back,color:Colors.white, size: 20,),
                          ),
                          TextRubikRegular("Go back",
                              "left", 18.0, Colors.white, false),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Image.asset("assets/images/sound.png",width: 20,height: 20,),
                      ),
                      TextRubikRegular("Click on the letters for sound",
                          "left", 12.0, Colors.white, false),
                    ],
                  )
                ],
              ),

              //vowel

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: TextRubikRegular(widget.name,
                      "left", 24.0, Colors.white, false),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: TextRubikRegular("Select a card to expand",
                      "left", 16.0, Colors.white, false),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 2,bottom: 40),
                child: Center(
                  child: TextRubikRegular("विस्तृत करण्यासाठी कार्ड निवडा",
                      "left", 16.0, Colors.white, false),
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

                                //Layout 2: white_card_on_dark_background
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActivityWhiteCardOnDarkBgSlider()));

                              },

                            child: Card(
                              color: Colors.white,
                              child: Center(child: TextRubikRegular(
                                  "${vowelDetailsModel[index].vowelName}",
                                  "left",
                                  30.0,appColors.hintHeadingColor,
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
