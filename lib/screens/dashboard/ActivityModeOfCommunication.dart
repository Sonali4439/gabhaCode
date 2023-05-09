import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';

class ActivityModeOfCommunication extends StatefulWidget {
  const ActivityModeOfCommunication({Key? key}) : super(key: key);

  @override
  State<ActivityModeOfCommunication> createState() => _ActivityModeOfCommunicationState();
}

class _ActivityModeOfCommunicationState extends State<ActivityModeOfCommunication> {
  AppColors appColors = AppColors();
  String? mediaValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                    TextRubikRegular("Mode of communication",
                        "left", 18.0, appColors.hintHeadingColor, false),

                  ],
                ),
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: TextRubikRegular("Mode of communication", "left",
                  18.0, appColors.hintHeadingColor, false),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
              child: TextRubikRegular(
                  "We did like to send you updates related to your subscription, childs progress, etc.",
                  "left",
                  14.0,
                  appColors.subHeadingColor,
                  false),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 10, left: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                            value: "WhatsApp",
                            activeColor: appColors.mainHeadingColor,
                            groupValue: mediaValue,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                mediaValue = value.toString();
                              });
                            }),
                        TextRubikRegular("WhatsApp", "left", 18.0,
                            appColors.hintHeadingColor, false),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                            value: "Email",
                            activeColor: appColors.mainHeadingColor,
                            groupValue: mediaValue,
                            onChanged: (value) {
                              setState(() {
                                mediaValue = value.toString();
                              }); //selected value
                            }),
                        TextRubikRegular("Email", "left", 18.0,
                            appColors.hintHeadingColor, false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
