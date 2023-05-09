import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';

class ActivityTheoryWithoutOptionalParameter extends StatefulWidget {
  const ActivityTheoryWithoutOptionalParameter({Key? key}) : super(key: key);

  @override
  State<ActivityTheoryWithoutOptionalParameter> createState() => _ActivityTheoryWithoutOptionalParameterState();
}

class _ActivityTheoryWithoutOptionalParameterState extends State<ActivityTheoryWithoutOptionalParameter> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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



                //name and icon
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRubikRegular("नाम  ",
                          "left", 50.0, appColors.hintHeadingColor, false),
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

                //para text
                TextRubikRegular("सिद्धांत",
                    "left", 18.0, appColors.hintHeadingColor, false),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextRubikRegular("कोणत्याही सजीव किंवा निर्जीव, प्रत्यक्षात असलेल्या किंवा काल्पनिक असणाऱ्या वस्तूंना किंवा तिच्या गूणधर्माला दिलेल्या नावांना नाम असे म्हणतात.",
                      "left", 18.0, appColors.hintHeadingColor, false),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextRubikRegular("१.  प्रत्यक्षात असणाऱ्या वस्तू किंवा सजीव किंवा निर्जीव - रमेश, मुलगा, चेंडू, पुस्तक, भांडी, दप्तर, पेन इ.\n२. काल्पनिक - देव, परी, अप्सरा, स्वर्ग, नरक\n३. गुणधर्म सांगणारे शब्द -चिकाटी, गोडी, दूरदृष्टी, धैर्य, शौर्य, निडर, उदास, दुःख, आनंद.",
                      "left", 18.0, appColors.hintHeadingColor, false),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

