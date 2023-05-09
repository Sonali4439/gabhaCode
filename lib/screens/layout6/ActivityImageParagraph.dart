import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelsModel.dart';

class ActivityImageParagraph extends StatefulWidget {
  const ActivityImageParagraph({Key? key}) : super(key: key);

  @override
  State<ActivityImageParagraph> createState() => _ActivityImageParagraphState();
}

class _ActivityImageParagraphState extends State<ActivityImageParagraph> {
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 40),
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
                    child: TextRubikRegular("चित्रवर्णन १  ",
                        "left", 32.0, appColors.hintHeadingColor, false),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2,bottom: 30),
                    child: TextRubikRegular("Picture Comprehension 1 ",
                        "left", 16.0, appColors.hintHeadingColor, false),
                  ),
                ),

                Image.asset("assets/images/pic.png",),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRubikRegular("परिच्छेद ",
                          "left", 18.0, appColors.hintHeadingColor, false),
                      Row(
                        children: [
                          TextRubikRegular("Listen ",
                              "left", 12.0, appColors.mainHeadingColor, false),
                          Image.asset("assets/images/sound_circle.png",width: 40,height: 40,),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'मोकळ्या मैदानात मुले लगोरी हा खेळ खेळताना दिसत आहेत. एक मुलगा लगोरी फोडण्याचा प्रयत्न करत आहेत. दोन मुली व तीन मुले मिळून लगोरी खेळत आहेत. सर्वच लगोरी चा आनंद घेत आहेत.',
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: TextStyle(
                        height: 1.5,
                       fontSize: 20,
                        color: appColors.hintHeadingColor,
                      ),
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
