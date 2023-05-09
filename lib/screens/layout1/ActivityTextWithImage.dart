import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/TextRubikRegular.dart';
import '../model/vowelsModel.dart';

class ActivityTextWithImage extends StatefulWidget {
  const ActivityTextWithImage({Key? key}) : super(key: key);

  @override
  State<ActivityTextWithImage> createState() => _ActivityTextWithImageState();
}

class _ActivityTextWithImageState extends State<ActivityTextWithImage> {
  AppColors appColors = AppColors();
  CarouselController carouselController = new CarouselController();
  int _currentIndex = 0;
  int? _totalIndex;
  List<VowelsModel> vowelsData=[
    VowelsModel( name: 'अ',),
    VowelsModel( name: 'आ'),
    VowelsModel( name: 'इ'),
    VowelsModel( name: 'ई'),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
          child: Column(
            children: [
              Expanded(
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.arrow_back,color:appColors.hintHeadingColor, size: 20,),
                              ),
                              TextRubikRegular("Go back",
                                  "left", 18.0, appColors.hintHeadingColor, false),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Image.asset("assets/images/sound_black.png",width: 20,height: 20,),
                            ),
                            TextRubikRegular("Click on the letters for sound",
                                "left", 12.0, appColors.hintHeadingColor, false),
                          ],
                        )
                      ],
                    ),

                    //slider

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            carouselController.previousPage();
                          },
                            child:  Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: appColors.mainHeadingColor,
                                  shape: BoxShape.circle
                              ),
                              child:Icon(Icons.arrow_back_ios,
                                color: Colors.white, size: 20,))
                            ),

                           /* Icon(Icons.arrow_back,color: appColors.hintHeadingColor, size: 20,)),*/

                        SizedBox(
                          height: 300,
                          width: 280,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height:320,
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
                              },

                            ),
                            carouselController: carouselController,
                            items: vowelsData.map((vowelDetailsModel) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 60),
                                        child: Center(
                                          child: TextRubikRegular(
                                              "${vowelDetailsModel.name}",
                                              "left",
                                              160.0,appColors.hintHeadingColor,
                                              false),
                                        ),
                                      ),

                                    ],
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),

                        GestureDetector(
                            onTap: (){
                              carouselController.nextPage();
                            },
                            child:  Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: appColors.mainHeadingColor,
                                    shape: BoxShape.circle
                                ),
                                child:Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 20,))
                        ),
                      ],
                    ),

                    //grid
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      shrinkWrap: true,
                      children: List.generate(vowelsData.length, (index) {
                        return Center(
                            child:GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                        contentPadding: EdgeInsets.only(top: 0.0),
                                       content: Container(
                                         width: 300.0,
                                         child: Column(
                                           mainAxisSize: MainAxisSize.min,
                                           children: [
                                             ClipRRect(
                                               borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
                                               child: Image.asset("assets/images/bear_img.png",),
                                             ),
                                             Center(
                                               child: Padding(
                                                 padding: const EdgeInsets.only(top: 8.0),
                                                 child: TextRubikRegular(
                                                   /* "${vowelsData[index].name}",*/
                                                     "${vowelsData[_currentIndex].name}",
                                                     "left",
                                                     30.0,appColors.hintHeadingColor,
                                                     false),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),

                                      );
                                    });
                              },
                              child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                                        child: Image.asset("assets/images/bear_img.png",),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: TextRubikRegular(
                                           /* "${vowelsData[index].name}",*/
                                            "${vowelsData[_currentIndex].name}",
                                            "left",
                                            30.0,appColors.hintHeadingColor,
                                            false),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ));
                      }
                      ),
                    ),

                    SizedBox(
                      height: 80,
                      child: ListView.builder(itemBuilder:  (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: "${vowelsData[index].name}" =="${vowelsData[_currentIndex].name}"
                               ? appColors.mainHeadingColor :Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Center(
                                child: TextRubikRegular(
                                    "${vowelsData[index].name}",
                                    "left",
                                    20.0,appColors.hintHeadingColor,
                                    false),
                              ),
                            ),
                          ),
                        );
                      },

                        itemCount: vowelsData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,),
                    )







                  ],),
              ),




            ],
          ),
        ),
      ),
    );

  }
}
