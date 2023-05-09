import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/wrapper/ResponseSection.dart';
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
  List<SectionHomeModel> sectionHomeModel=[
    SectionHomeModel( sectionName: 'श्रेणी १ Section 1'),
    SectionHomeModel( sectionName: 'श्रेणी २ Section 2'),
    SectionHomeModel( sectionName: 'श्रेणी ३ Section 3'),
  ];

  List<SectionImagesModel> sectionImagedata=[
    SectionImagesModel( sectionImg: "assets/images/section_imgs.png"),
    SectionImagesModel( sectionImg: "assets/images/section_img1.png"),
   // SectionImagesModel( sectionImg: "assets/images/section_imgs.png"),
  ];

  List<CategoryList>? categoryList=[];

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

  void getCategoryByBoardAndGradeAndUserToken() async {
    Response<ResponseSection> response =
    await core.getCategoryByBoardAndGradeAndUserToken("${PreferenceUtils.getString("board_id")}",'${PreferenceUtils.getString("grade_id")}',0,0);
    if (response.body?.status?.statusCode == 0) {
      setState(() {
        categoryList = response.body?.payload;
      });
    }
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
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
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
              TextRubikRegular(
                  "Home",
                  "left",
                  24.0,appColors.hintHeadingColor,
                  true),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 30),
                child: TextRubikRegular(
                   /* "Vedant Patil!",*/
                  "${PreferenceUtils.getString("gabha_user_name")}".isNotEmpty
                   ? '${PreferenceUtils.getString("gabha_user_name")}'
                    :"",
                    "left",
                    16.0,appColors.subHeadingColor,
                    false),
              ),


              Expanded(
                child: ListView.builder(itemBuilder:
                    (BuildContext context, int index) {
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
                               "श्रेणी १ Section 1",
                                  "left",
                                  18.0,appColors.hintHeadingColor,
                                  false),
                            ],
                          ),

                          //inside listview
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: ListView.builder(itemBuilder:  (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActivityHomeSectionDetails(categoryId :/*categoryList!.elementAt(index).id,*/"6447c40d436f5f4df705dc05")));

                                },
                                child:
                              /*  Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,10,10),
                                  child:  Image.asset("${sectionImagedata[index].sectionImg}",),
                                ),*/
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    height: 200,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                          child: Image.asset("assets/images/bear_img.png",),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: TextRubikRegular(
                                              /* "${vowelsData[index].name}",*/
                                                "अक्षर ओळख ",
                                                "left",
                                                12.0,appColors.hintHeadingColor,
                                                false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),



                              );
                            },

                                scrollDirection: Axis.horizontal,
                                itemCount: sectionImagedata.length),
                          ),


                        ],
                      ),
                    ),
                  );
                },
                    scrollDirection: Axis.vertical,
                    itemCount: categoryList!.length),
              ),

              SizedBox(height: 50,)





            ],
          ),
        ),
      ),




   ] )
    );
  }
}
