import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/wrapper/ResponseSection.dart';
import 'package:gabha_app1/screens/home/AcitivtyHome.dart';
import 'package:gabha_app1/screens/home/newWrappers/SectionCategory.dart';
import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/SharedPrefrenceSessionManager.dart';
import '../model/SectionImagesModel.dart';
import '../model/childModel.dart';
import '../model/sectionHomeModel.dart';
import 'ActivityHomeSectionDetails.dart';

class ActivityHomeLists extends StatefulWidget {
  const ActivityHomeLists({Key? key}) : super(key: key);

  @override
  State<ActivityHomeLists> createState() => _ActivityHomeListsState();
}

class _ActivityHomeListsState extends State<ActivityHomeLists> {
  AppColors appColors = AppColors();
  Core core = Core();
  // List<SectionImagesModel> sectionImagedata=[
  //   SectionImagesModel( sectionImg: "assets/images/section_imgs.png"),
  //   SectionImagesModel( sectionImg: "assets/images/section_img1.png"),
  //  // SectionImagesModel( sectionImg: "assets/images/section_imgs.png"),
  // ];
  //
  // List<SectionHomeModel> sectionHomeModel=[
  //   SectionHomeModel( sectionName: 'श्रेणी १ Section 1'),
  //   SectionHomeModel( sectionName: 'श्रेणी २ Section 2'),
  //   SectionHomeModel( sectionName: 'श्रेणी ३ Section 3'),
  // ];

  List<CategoryList>? categoryList=[];
  List<SectionCategory>? sectionCategoryList=[];

  List<int>? sectionCount=[1,2];

  @override
  void initState() {
    print('---grade-id-----${PreferenceUtils.getString("grade_id")}');
    print('----board-id----${PreferenceUtils.getString("board_id")}');
    super.initState();
    onResume();




  }
  void onResume(){
    getCategoryByBoardAndGradeAndUserToken();
  }

 /* void getCategoryUniqueSections() async {
    Response<ResponseSection> response =
    await core.getCategoryUniqueSections("${PreferenceUtils.getString("board_id")}",'${PreferenceUtils.getString("grade_id")}',0,0);
    if (response.body?.status?.statusCode == 0) {
     *//* setState(() {
        categoryList = response.body?.payload;
      });*//*
    }
  }*/

  void getCategoryByBoardAndGradeAndUserToken() async {
    Response<ResponseSection> response = await core.getCategoryByBoardAndGradeAndUserToken("645b6d327b6977d8140fee9f",'645b6d3b7b6977d8140feea5',0,0);
    // await core.getCategoryByBoardAndGradeAndUserToken("${PreferenceUtils.getString("board_id")}",'${PreferenceUtils.getString("grade_id")}',0,0);
    if (response.body?.status?.statusCode == 0) {
      setState(() {
        categoryList = response.body?.payload;
      });
      setupData();
    }
  }


  void setupData(){
    sectionCategoryList=[];
    sectionCount!.asMap().forEach((key, sectionCountValue) {
      SectionCategory sectionCategory = SectionCategory();
      List<CategoryList> categoryListTemp = [];
      categoryList!.asMap().forEach((key, categoryListValue) async {
        if(sectionCountValue == categoryListValue.section){
          sectionCategory.id = categoryListValue.id;
          sectionCategory.name = categoryListValue.categoryName;
          categoryListTemp.add(categoryListValue);
        }
      });
      sectionCategory.categoryList = categoryListTemp;
      sectionCategoryList!.add(sectionCategory);
    });


    debugPrint('----sectionCategoryList---${sectionCategoryList!.length}');
    debugPrint('----sectionCategoryList---${sectionCategoryList!.elementAt(0).categoryList!.length}');
    debugPrint('----sectionCategoryList---${sectionCategoryList!.elementAt(1).categoryList!.length}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(
        children: [
        Positioned(
        bottom: -4,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              boxShadow: [
                BoxShadow(color: appColors.hintHeadingColor.withOpacity(0.5), spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'You are using a Free Trial ',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: appColors.hintHeadingColor),
                      children:  <TextSpan>[
                        TextSpan(text: "Buy Subscription", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: appColors.mainHeadingColor)),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward,color: appColors.mainHeadingColor, size: 20,),
                ],
              ),
            ),
        ),
        )),

      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: (){
                  // if("${PreferenceUtils.getString("gabha_isParent")}" =="true")
                  // debugPrint("home page call");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityHomeLists()));
                },
                child: Column(
                  children: [
                    TextRubikRegular(
                        "Home",
                        "left",
                        24.0,appColors.hintHeadingColor,
                        true),
                    TextRubikRegular(
                      /* "Vedant Patil!",*/
                        "${PreferenceUtils.getString("gabha_user_name")}".isNotEmpty
                            ? '${PreferenceUtils.getString("gabha_user_name")}'
                            :"",
                        "left",
                        16.0,appColors.subHeadingColor,
                        false),
                  ],
                ),
              ),



              Expanded(
                child: ListView.builder(itemBuilder:
                    (BuildContext context, int sectionCategoryListIndex) {
                  return GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRubikRegular(
                               "श्रेणी ${sectionCategoryListIndex+1} Section ${sectionCategoryListIndex+1}",
                                  "left",
                                  18.0,appColors.hintHeadingColor,
                                  false),
                            ],
                          ),

                          //inside listview
                          Container(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(itemBuilder:  (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityHomeSectionDetails(categoryId :sectionCategoryList!.elementAt(sectionCategoryListIndex).categoryList!.elementAt(index).id)));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    decoration: appColors.greyColorBorderBoxDropDown,
                                    // height: 150,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Image.network("${sectionCategoryList!.elementAt(sectionCategoryListIndex).categoryList!.elementAt(index).imageFilepath}")),
                                        Container(
                                          color: appColors.mainHeadingColor,
                                          height: 40,
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all( 8.0),
                                              child: TextRubikRegular(
                                                "${sectionCategoryList!.elementAt(sectionCategoryListIndex).categoryList!.elementAt(index).categoryName}",
                                                //   "अक्षर ओळख ",
                                                  "left",
                                                  13.0,Colors.white,
                                                  false),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),



                              );
                            },

                                scrollDirection: Axis.horizontal,
                                itemCount: sectionCategoryList!.elementAt(sectionCategoryListIndex).categoryList!.length),
                          ),


                        ],
                      ),
                    ),
                  );
                },
                    scrollDirection: Axis.vertical,
                    itemCount: sectionCategoryList!.length),
              ),

              const SizedBox(height: 50,)





            ],
          ),
        ),
      ),




   ] )
    );
  }
}
