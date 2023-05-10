import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetSubCategory.dart';
import 'package:gabha_app1/screens/home/wrapper/SubCategoryList.dart';
import 'package:gabha_app1/screens/layout5/ActivityListMultiLineContent.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/SharedPrefrenceSessionManager.dart';
import '../layout1/ActivityTextWithImage.dart';
import '../layout10/ActivityTheoryWithOptionalParameter.dart';
import '../layout10/ActivityTheoryWithoutOptinalParameter.dart';
import '../layout2/ActivityWhiteCardOnDarkBg.dart';
import '../layout3/ActivityDarkCardOnWhiteBg.dart';
import '../layout5/ActivityListContent.dart';
import '../layout6/ActivityImageParagraph.dart';
import '../layout7/ActivityCardWithTwoImages.dart';
import '../layout9/ActivityCardWithImage.dart';
import '../model/childModel.dart';
import '../model/vowelsModel.dart';

class ActivityHomeSectionDetails extends StatefulWidget {
  String? categoryId;
  ActivityHomeSectionDetails({super.key, required this.categoryId});
 // const ActivityHomeSectionDetails({Key? key}) : super(key: key);

  @override
  State<ActivityHomeSectionDetails> createState() => _ActivityHomeSectionDetailsState();
}

class _ActivityHomeSectionDetailsState extends State<ActivityHomeSectionDetails> {
  AppColors appColors = AppColors();
  List<VowelsModel> vowelsData=[
    VowelsModel( name: 'स्वर Vowel',),
    VowelsModel( name: 'व्यंजन Consonents'),
  ];

  Core core = Core();

  List<SubCategoryList>? subCategoryList=[];

  @override
  void initState() {
    print('---grade-id-----${PreferenceUtils.getString("grade_id")}');
    print('----board-id----${PreferenceUtils.getString("board_id")}');
    super.initState();
    onResume();
  }
  void onResume(){
     getSubcategoryByCategoryBoardAndGrade();
  }

  void getSubcategoryByCategoryBoardAndGrade() async {
    Response<ResponseGetSubCategory> response = await core.getSubcategoryByCategoryBoardAndGrade("645b6d327b6977d8140fee9f",'645b6d3b7b6977d8140feea5',"${widget.categoryId}",0,0);
    if (response.body?.status?.statusCode == 0) {
      setState(() {
        subCategoryList = response.body?.payload;
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
                      TextRubikRegular("मुळाक्षर Vowels & Consonents",
                          "left", 18.0, appColors.hintHeadingColor, false),

                    ],
                  ),
                ),
              ),



              Expanded(
                child: ListView.separated(itemBuilder:  (BuildContext context, int index) {
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextRubikRegular(
                                          (subCategoryList!.elementAt(index).categoryList!.languageName ==null)
                                          ?""
                                          :"${subCategoryList!.elementAt(index).categoryName}",
                                         /* "${vowelsData[index].name}",*/
                                          "left",
                                          18.0,appColors.hintHeadingColor,
                                          false),

                                    ],
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  print("sectionnnnnnnnnnnnnnnnn---${subCategoryList!.elementAt(index).layout!.layout}");

                                  if(subCategoryList!.elementAt(index).layout!.layout == "Card with two images"){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ActivityCardWithTwoImages()));
                                  }

                                   //Layout 2: white_card_on_dark_background
                                 /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityWhiteCardOnDarkBg(name:"${vowelsData[index].name}")));*/


                                  //Layout 3 : dark_card_on_white_background_paper
                                  /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityDarkCardOnWhiteBg(name:"${vowelsData[index].name}")));*/

                                  //Layout 4:Cards
                                  //layout 4 card is same as layout 2 -navigation


                                  //Layout 5: List if single line
                              /*    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityListContent()));*/

                                  //Layout 5: List if multi line
                                 /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityListMultiLineContent()));*/

                                  // Layout 7: cards_with_two_images
                                  /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityCardWithTwoImages()));*/


                                  //  Layout 9: card_with_images
                                 /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityCardWithImage()));*/


                                  //Layout 6: image_paragraph
                                /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityImageParagraph()));*/

                                  //Layout 10: theory With Optional Paragraph
                                /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityTheoryWithOptionalParameter()));*/

                                  //Layout 10: theory without Optional Paragraph
                                 /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityTheoryWithoutOptionalParameter()));*/

                                  //Layout 1: text_with_image
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ActivityTextWithImage()));


                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Image.asset("assets/images/learn_img.png",width: 25,height: 25,)
                                      ),
                                      TextRubikRegular(
                                        "Learn",
                                        "left",
                                        16.0,
                                       appColors.mainHeadingColor,
                                        false,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Image.asset("assets/images/worksheet_img.png",width: 25,height: 25,)
                                  ),
                                  TextRubikRegular(
                                    "Worksheet",
                                    "left",
                                    16.0,
                                    appColors.mainHeadingColor,
                                    false,
                                  ),

                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: subCategoryList!.length),
              )

            ],
          ),
        ),
      ),
    );
  }
}

