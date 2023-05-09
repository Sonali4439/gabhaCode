import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/screens/dashboard/ActivityChildDetailsList.dart';
import 'package:gabha_app1/screens/registration/wrapper/AnnualMemberships.dart';
import 'package:gabha_app1/screens/registration/wrapper/RequestAddSubscription.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAddUserSubscription.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAnnualMembership.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomElevatedButton.dart';
import '../../constant/TextRubikRegular.dart';
import '../dashboard/DashboardScreen.dart';

class AnnualMembershipScreen extends StatefulWidget {
  String userId;
  String flag;
  AnnualMembershipScreen({required this.userId,required this.flag});
  //const AnnualMembershipScreen({Key? key}) : super(key: key);

  @override
  State<AnnualMembershipScreen> createState() => _AnnualMembershipScreenState();
}

class _AnnualMembershipScreenState extends State<AnnualMembershipScreen> {
  AppColors appColors = AppColors();
  Core core = Core();
  List<AnnualMemberships>? annualMembershipList = [];
  String? gradeName;
  String? boardName;
  bool acceptCheckboxValue = false;
  String? subscriptionId;
  int? price;
  int? discountPrice;

  @override
  void initState() {
    super.initState();
    onResume();
  }

  void onResume() {
    getSubscription();
  }

  void getSubscription() async {
    Response<ResponseAnnualMembership> response =
    await core.getSubscription("", 0, 0);
    if (response.body?.status?.statusCode == 0) {
      setState(() {
        annualMembershipList = response.body?.payload;
      });
    }
  }

  void addSubscription() async {
    RequestAddSubscription requestAddSubscription = RequestAddSubscription();
    requestAddSubscription.userId = widget.userId;
    requestAddSubscription.subscriptionId = subscriptionId;
    requestAddSubscription.price = price;
    requestAddSubscription.discountPrice = discountPrice;

    debugPrint(requestAddSubscription.userId);
    debugPrint(requestAddSubscription.subscriptionId);


    Response<ResponseAddUserSubscription> response = await core.addSubscription(requestAddSubscription);

       if (response.body?.status?.statusCode == 0) {
         debugPrint("buy-----------");
      setState(() {
        if(widget.flag == "Registration")
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardScreen()),
            );
          }
        if(widget.flag=="AddChild")
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ActivityChildDetailsList()),
            );
          }

      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: TextRubikRegular("Annual Membership ", "left", 24.0,
                        appColors.memberShipColor, true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: TextRubikRegular(
                        "What we offer in the annual membership ?",
                        "left",
                        18.0,
                        appColors.hintHeadingColor,
                        false),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(10),
                         /* decoration: BoxDecoration(
                            border: Border.all(
                                color: appColors.containerBorderColor),
                            borderRadius: BorderRadius.circular(20),
                          ),*/
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Access to ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: appColors.hintHeadingColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'notes',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: appColors.mainHeadingColor)),
                                    TextSpan(
                                        text: ' or specific Board and class.!'),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Transform.translate(
                        offset: const Offset(25.0, -20.0),
                        child: Image.asset(
                          "assets/images/container_notes.png",
                          width: 120,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(10),
                         /* decoration: BoxDecoration(
                            border: Border.all(
                                color: appColors.containerBorderColor),
                            borderRadius: BorderRadius.circular(20),
                          ),*/
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Access to ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: appColors.hintHeadingColor),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                          ' Audio Visual Marathi content.',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                              appColors.mainHeadingColor)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Transform.translate(
                        offset: const Offset(0.0, -20.0),
                        child: Image.asset(
                          "assets/images/annual_img1.png",
                          width: 120,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(10),
                         /* decoration: BoxDecoration(
                            border: Border.all(
                                color: appColors.containerBorderColor),
                            borderRadius: BorderRadius.circular(20),
                          ),*/
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Worksheets ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: appColors.mainHeadingColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: appColors.hintHeadingColor)),
                                    TextSpan(
                                        text: 'Activities',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: appColors.mainHeadingColor)),
                                    TextSpan(
                                        text: ' for each Section.',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: appColors.hintHeadingColor)),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Transform.translate(
                        offset: const Offset(25.0, -20.0),
                        child: Image.asset(
                          "assets/images/annual_img2.png",
                          width: 100,
                        ),
                      )
                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: SizedBox(
                      width: 300,
                      child: Divider(
                          color: appColors.containerBorderColor,
                          thickness: 1,
                          height: 3,
                      ),
                    ),
                  ),
                ),




                ListView.builder(itemBuilder: (BuildContext context, int index) {
                  if(annualMembershipList!.elementAt(index).academicYear != null){
                     gradeName="${annualMembershipList!.elementAt(index).academicYear!.grade!.grade}";
                     boardName="${annualMembershipList!.elementAt(index).academicYear!.grade!.board!.boardShortName}";
                  }
                  return GestureDetector(
                    onTap: (){
                      subscriptionId=annualMembershipList![index].id;
                      price=annualMembershipList![index].subscriptionPrice;
                      discountPrice=annualMembershipList![index].discountPrice;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextRubikRegular("Your Plan", "left", 22.0,
                          appColors.mainHeadingColor, true),

                          TextRubikRegular(
                              (annualMembershipList![index].subscriptionPrice ==null)
                                  ?""
                                  :"₹ ${annualMembershipList![index].subscriptionPrice}",
                              /* "${vowelsData[index].name}",*/
                              "left",
                              18.0,appColors.hintHeadingColor,
                              false),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: TextRubikRegular("1 Academic Year", "left", 14.0,
                                      appColors.hintHeadingColor, false),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: TextRubikRegular("Board: $boardName", "left", 14.0,
                                      appColors.hintHeadingColor, false),
                                ),

                                TextRubikRegular("Grade: $gradeName", "left", 14.0,
                                    appColors.hintHeadingColor, false),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
                    shrinkWrap: true,
                    itemCount: annualMembershipList!.length),




          Center(
            child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                side:  BorderSide(
                  color: appColors.mainHeadingColor,
                  width: 2,
                ),
                title: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: appColors.hintHeadingColor,),
                    children:  <TextSpan>[
                      TextSpan(text: "Terms & conditions", style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: appColors.addChildColor)),
                    ],
                  ),
                ),
                activeColor: appColors.mainHeadingColor,
                value: acceptCheckboxValue,
                onChanged: (value) {
                  setState(() {});
                  acceptCheckboxValue = value!;
                }),
          ),

                CustomElevatedButton(
                    buttonText: 'Buy Subscription',
                    buttonTextFont: 18,
                    buttonTextColour: Colors.white,
                    buttonTextIsBold: false,
                    onPressed: () {
                      addSubscription();
                    },
                    buttonColor: appColors.mainHeadingColor,
                    buttonBorderRadius: 10.0,
                    buttonBorderRadiusColor: Colors.green,
                    buttonHeight: 50,
                    buttonWidth: MediaQuery.of(context).size.width * 0.90,
                    iconAlignment: "center",
                    // buttonIconData: Icons.menu_book,
                    buttonIconData: Icons.arrow_forward_ios,
                    buttonIconColor:appColors.mainHeadingColor,
                    buttonIconSize: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 10),
                  child: CustomElevatedButton(
                      buttonText: 'Continue with free trial',
                      buttonTextFont: 18,
                      buttonTextColour: appColors.mainHeadingColor,
                      buttonTextIsBold: false,
                      onPressed: () {
                        addSubscription();
                        /* Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );*/
                      },
                      buttonColor: Colors.white,
                      buttonBorderRadius: 10.0,
                      buttonBorderRadiusColor: appColors.mainHeadingColor,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width * 0.90,
                      iconAlignment: "center",
                      // buttonIconData: Icons.menu_book,
                      buttonIconData: Icons.arrow_forward_ios,
                      buttonIconColor: Colors.white,
                      buttonIconSize: 16),
                ),



                //your plan

             /*   Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: TextRubikRegular("Your Plan", "left", 22.0,
                        appColors.mainHeadingColor, true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Center(
                    child: TextRubikRegular("₹ 599/-", "left", 22.0,
                        appColors.hintHeadingColor, false),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: TextRubikRegular("1 Academic Year", "left", 14.0,
                        appColors.hintHeadingColor, false),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: TextRubikRegular("Board: CBSC", "left", 14.0,
                            appColors.hintHeadingColor, false),
                      ),

                      TextRubikRegular("Grade: 4th", "left", 14.0,
                          appColors.hintHeadingColor, false),

                    ],
                  ),
                )*/

              ],
            ),
          ),
        ),
      ),
    /*  bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
                buttonText: 'Buy Subscription',
                buttonTextFont: 18,
                buttonTextColour: Colors.white,
                buttonTextIsBold: false,
                onPressed: () {
                  addSubscription();
                },
                buttonColor: appColors.mainHeadingColor,
                buttonBorderRadius: 10.0,
                buttonBorderRadiusColor: Colors.green,
                buttonHeight: 50,
                buttonWidth: MediaQuery.of(context).size.width * 0.90,
                iconAlignment: "center",
                // buttonIconData: Icons.menu_book,
                buttonIconData: Icons.arrow_forward_ios,
                buttonIconColor:appColors.mainHeadingColor,
                buttonIconSize: 16),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 10),
              child: CustomElevatedButton(
                  buttonText: 'Continue with free trial',
                  buttonTextFont: 18,
                  buttonTextColour: appColors.mainHeadingColor,
                  buttonTextIsBold: false,
                  onPressed: () {
                    addSubscription();
                   *//* Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );*//*
                  },
                  buttonColor: Colors.white,
                  buttonBorderRadius: 10.0,
                  buttonBorderRadiusColor: appColors.mainHeadingColor,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width * 0.90,
                  iconAlignment: "center",
                  // buttonIconData: Icons.menu_book,
                  buttonIconData: Icons.arrow_forward_ios,
                  buttonIconColor: Colors.white,
                  buttonIconSize: 16),
            ),

          ],
        ),
      ),*/
    );
  }
}
