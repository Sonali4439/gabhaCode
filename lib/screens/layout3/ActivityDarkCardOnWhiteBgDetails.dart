import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelModel.dart';

class ActivityDarkCardOnWhiteBgDetails extends StatefulWidget {
  const ActivityDarkCardOnWhiteBgDetails({Key? key}) : super(key: key);

  @override
  State<ActivityDarkCardOnWhiteBgDetails> createState() => _ActivityDarkCardOnWhiteBgDetailsState();
}

class _ActivityDarkCardOnWhiteBgDetailsState extends State<ActivityDarkCardOnWhiteBgDetails> {
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



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.mainHeadingColor,
      body: Stack(
          children: [
          Positioned(
          bottom: -4,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(color: appColors.hintHeadingColor.withOpacity(0.5), spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      print("2222222222222222222");
                    /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityWritingPad()));*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset("assets/images/edit_img.png",width: 30,height: 30,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextRubikRegular("लिहिण्याचा सराव ",
                                    "left", 18.0, appColors.hintHeadingColor, false),
                                TextRubikRegular("Writing Practice ",
                                    "left", 18.0, appColors.hintHeadingColor, false),
                              ],
                            ),
                          ],
                        ),

                        Image.asset("assets/images/both_side_arrow.png",width: 50,height: 50,),


                      ],
                    ),
                  ),
                )
              ),
            ),
          )),

      SafeArea(
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


              Padding(
                padding: const EdgeInsets.only(top: 60,bottom: 30),
                child: Center(
                  child: SizedBox(
                    height: 80,
                    width: 70,
                    child: Card(
                        color: Colors.white,
                        child: Center(child: TextRubikRegular(
                            "क",
                            "left",
                            30.0,appColors.hintHeadingColor,
                            false),
                        )
                    ),
                  ),
                ),
              ),


              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 12.0,
                  children: List.generate(vowelDetailsModel.length, (index) {
                    return Center(
                        child:GestureDetector(
                          onTap: (){

                            //Layout 2: white_card_on_dark_background
                          /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActivityWhiteCardOnDarkBgSlider()));*/

                          },

                          child: SizedBox(
                            height: 130,
                            width: 85,
                            child: Card(
                                color: Colors.white,
                                child: Center(child: TextRubikRegular(
                                    "${vowelDetailsModel[index].vowelName}",
                                    "left",
                                    30.0,appColors.hintHeadingColor,
                                    false),
                                )
                            ),
                          ),
                        ));
                  }
                  ),
                ),
              ),



            ],
          ),
        ),
      ),]
    ));
  }
}

