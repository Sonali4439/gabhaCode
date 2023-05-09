import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/constant/AppColors.dart';
import 'package:gabha_app1/constant/TextRubikRegular.dart';
import 'package:gabha_app1/screens/model/vowelModel.dart';
import 'package:gabha_app1/screens/registration/activityMobileScreen.dart';

class ActivityOnBoarding extends StatefulWidget {
  const ActivityOnBoarding({Key? key}) : super(key: key);

  @override
  State<ActivityOnBoarding> createState() => _ActivityOnBoardingState();
}

class _ActivityOnBoardingState extends State<ActivityOnBoarding> {
  AppColors appColors = AppColors();
  int _currentIndex = 0;
  int? _totalIndex;
  CarouselController carouselController =  CarouselController();
  List<VowelDetailsModel> vowelDetailsModel=[
    VowelDetailsModel( vowelName: 'Marathi Learning App',name2: "For academic syllabus",img:"assets/images/slider_img1.png" ),
    VowelDetailsModel( vowelName: 'Bilingual Approach',name2: "Learn Marathi using English as a foundation",img:"assets/images/slider_img2.png"),
    VowelDetailsModel( vowelName: 'Basic to Advanced language concepts',name2: "From Alphabets to Creative Writing",img:"assets/images/slider_img3.png"),
    VowelDetailsModel( vowelName: 'Revise Concepts',name2: "eWorksheets provided to practice every topic learnt",img:"assets/images/slider_img4.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0,left: 0,right: 0),
          child: Container(
            color: Colors.white,

            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 2 / 1,
                autoPlayCurve: Curves.linear,
                enableInfiniteScroll: false,
                 autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState((){});
                  _totalIndex=vowelDetailsModel.length;
                },

              ),

              items: vowelDetailsModel.map((vowelDetailsModel) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: TextRubikRegular(
                                    "${vowelDetailsModel.vowelName}",
                                    "center",
                                    20.0,appColors.mainHeadingColor,
                                    true),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextRubikRegular(
                                    "${vowelDetailsModel.name2}",
                                    "center",
                                    16.0,appColors.hintHeadingColor,
                                    false),
                              ),
                            ],
                          ),
                        ),



                        Expanded(
                          flex: 8,
                          child: Image.asset( "${vowelDetailsModel.img}",
                            fit: BoxFit.fill,
                          ),
                        ),

                      ],
                    );
                  },
                );
              }).toList(),


            ),
          ),
        ),
      ),

        bottomNavigationBar:
       Container(
         color: Colors.white,
         height: 60,
         child: Padding(
           padding: const EdgeInsets.only(left: 15,right: 15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: vowelDetailsModel.asMap().entries.map((entry) {
                   return GestureDetector(
                     onTap: () => carouselController.animateToPage(entry.key),
                     child: Container(
                       width: 15,
                       height: 15,
                       alignment: Alignment.center,
                       margin: const EdgeInsets.symmetric(
                           vertical: 8.0, horizontal: 4.0),
                       decoration: BoxDecoration(
                           border: Border.all(color: appColors.mainHeadingColor),
                         shape: BoxShape.circle,
                         color: _currentIndex ==entry.key
                         ? appColors.mainHeadingColor :Colors.white

                       ),

                     ),
                   );
                 }).toList(),
               ),


               _currentIndex==3
               ?  GestureDetector(
                 onTap: (){
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => ActivityMobileScreen(),
                     ),
                   );
                 },
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: TextRubikRegular("Get Start",
                           "left", 18.0,appColors.mainHeadingColor, false),
                     ),

                   ],
                 ),
               )
               :GestureDetector(
                 onTap: (){
                   carouselController.nextPage();
                 },
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: TextRubikRegular("Next",
                           "left", 18.0,appColors.mainHeadingColor, false),
                     ),
                     Icon(Icons.arrow_forward,color:appColors.mainHeadingColor, size: 20,),

                   ],
                 ),
               )


             ],
           ),
         ),
       )
    );
  }
}
