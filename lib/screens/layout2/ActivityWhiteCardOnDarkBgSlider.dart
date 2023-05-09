import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/vowelModel.dart';


class ActivityWhiteCardOnDarkBgSlider extends StatefulWidget {
  const ActivityWhiteCardOnDarkBgSlider({Key? key}) : super(key: key);

  @override
  State<ActivityWhiteCardOnDarkBgSlider> createState() => _ActivityWhiteCardOnDarkBgSliderState();
}

class _ActivityWhiteCardOnDarkBgSliderState extends State<ActivityWhiteCardOnDarkBgSlider> {
  AppColors appColors = AppColors();
  int _currentIndex = 0;
  int? _totalIndex;
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
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 50),
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


              //list

              CarouselSlider(
                options: CarouselOptions(
                  height:600,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                 // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    _currentIndex = index;
                    setState((){});
                    _totalIndex=vowelDetailsModel.length;
                  },
                ),

                items: vowelDetailsModel.map((vowelDetailsModel) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextRubikRegular(
                                              "स्वर Vowel",
                                              "left",
                                              20.0,appColors.hintHeadingColor,
                                              false),
                                          Image.asset("assets/images/sound_circle.png",width: 40,height: 40,),
                                        ],
                                      ),
                                    ),

                                     Padding(
                                       padding: const EdgeInsets.only(top: 60),
                                       child: Center(
                                         child: TextRubikRegular(
                                            "${vowelDetailsModel.vowelName}",
                                            "left",
                                            100.0,appColors.hintHeadingColor,
                                            true),
                                       ),
                                     ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Center(
                                        child: TextRubikRegular(
                                            "${vowelDetailsModel.vowelName} Pronounced like ‘a’ in America",
                                            "left",
                                            16.0,appColors.hintHeadingColor,
                                            false),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: TextRubikRegular(
                                      "$_currentIndex / $_totalIndex",
                                      "left",
                                      16.0,appColors.hintHeadingColor,
                                      false),
                                ),
                              ),
                            ],
                          )
                      );
                    },
                  );
                }).toList(),

              ),



           /*   SizedBox(
                height: 500,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child:  Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child:Column(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextRubikRegular(
                                              "स्वर Vowel",
                                              "left",
                                              20.0,appColors.hintHeadingColor,
                                              false),
                                          Image.asset("assets/images/sound_circle.png",width: 40,height: 40,),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: Center(
                                        child: TextRubikRegular(
                                            "${vowelDetailsModel[index].vowelName}",
                                            "left",
                                            100.0,appColors.hintHeadingColor,
                                            true),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Center(
                                        child: TextRubikRegular(
                                            "${vowelDetailsModel[index].vowelName} Pronounced like ‘a’ in America",
                                            "left",
                                            16.0,appColors.hintHeadingColor,
                                            false),
                                      ),
                                    ),



                                  ],
                                )
                            );
                          },
                          autoplay: false,
                          itemCount: vowelDetailsModel.length,
                          pagination: new SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: SwiperPagination.fraction),
                        ))
                  ],
                ),
              )*/



            ],
          ),
        ),
      ),
    );
  }
}


