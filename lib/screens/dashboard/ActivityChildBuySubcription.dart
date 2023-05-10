import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/constant/AppColors.dart';
import 'package:gabha_app1/constant/CustomTextFieldWiget.dart';
import 'package:gabha_app1/constant/TextRubikRegular.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/SharedPrefrenceSessionManager.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetStandard.dart';
import 'package:gabha_app1/screens/registration/annualMembershipScreen.dart';
import 'package:gabha_app1/screens/registration/wrapper/Board.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';

import '../registration/wrapper/ResponseGetAllBoard.dart';

class ActivityChildBuySubscription extends StatefulWidget {
  const ActivityChildBuySubscription({Key? key}) : super(key: key);

  @override
  State<ActivityChildBuySubscription> createState() => _ActivityChildBuySubscriptionState();
}

class _ActivityChildBuySubscriptionState extends State<ActivityChildBuySubscription> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent = true;
  TextEditingController controllerName = TextEditingController();
  List<String> list = <String>['1st', '2nd', '3rd', '4th', '5th'];

  List<Board>? boardList = [];
  Core core = Core();

  Board? selectedBoard;
  String? dropDownBoard = "Select";

  List<Grade>? gradeList = [];
  Grade? selectedGrade;
  String? dropDownGrade ;

  bool isButtonEnabled = false;

  // List<String>? gradeListData = ['Select'];

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Board board = Board();
    board.board = "Select";
    boardList!.add(board);

    controllerName.text = "${PreferenceUtils.getString("gabha_user_name")}";

    print("------------dropdown--------${PreferenceUtils.getString("board_full_name")}");

    /* gradeList = [];
    Grade defaultGrade = Grade();
    defaultGrade.grade =  "${widget.childList!.child!.userSubscription!.subscriptions!.academicYear!.grade!.grade}";
    gradeList!.add(defaultGrade );*/
    onResume();
  }

  onResume() {
    getAllBoard();

  }

  void getAllBoard() async {
    Response<ResponseGetAllBoard> response = await core.getAllBoard();
    if (response.body?.status?.statusCode == 0) {
      setState(() {
          response.body?.payload?.asMap().forEach((key, value) {
            boardList!.add(value);
          });
      });
      setState(() {
        response.body?.payload?.asMap().forEach((key, value) {
          if(value.board == PreferenceUtils.getString("board_full_name")){
            dropDownBoard = value.board;
            getAllGradeByBoard("${value.id}");
          }
        });
      });
    }
  }

  //get all grade by borad
  void getAllGradeByBoard(String boardId) async {
    Response<ResponseGetStandard> response = await core.getAllGradeByBoard(boardId);
    if (response.body?.status?.statusCode == 0) {
      gradeList =[];
      Grade defaultGrade = Grade();
      defaultGrade.id = "";
      defaultGrade.grade = "Select";
      gradeList!.add(defaultGrade);

      setState(() {
        response.body?.payload?.asMap().forEach((key, value) {
          gradeList!.add(value);
        });
      });

      setState(() {
        response.body?.payload?.asMap().forEach((key, value) {
          if(value.grade == PreferenceUtils.getString("grade_name")){
            dropDownGrade = value.grade;
          }
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          TextRubikRegular("Childs Details",
                              "left", 18.0, appColors.hintHeadingColor, false),

                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:Image.asset("assets/images/user_profile.png",)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextRubikRegular("Free Trial (10 Days)",
                                "left", 16.0, appColors.hintHeadingColor, false),
                          ),
                          TextRubikRegular("Buy Subscription",
                              "left", 16.0, appColors.addChildColor, false),
                        ],
                      ),
                    ),
                  ),




                  Padding(
                    padding:
                    const EdgeInsets.only(top: 40, left: 15, right: 15),
                    child: CustomFieldBox(
                        label: "Full Name",
                        inputValue: "Enter Your Full Name",
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controllerName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Full Name Here";
                          }
                          return null;
                        },
                        onChanged: (value) {}),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                    child: TextRubikRegular("Board", "left", 16.0,
                        appColors.hintHeadingColor, false),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.errorBorder,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      iconEnabledColor: appColors.mainHeadingColor,
                      hint: Text(
                        'What board does the school comes under ?',
                        style: TextStyle(
                            color: appColors.textFieldHintColor, fontSize: 15),
                      ),
                      value: dropDownBoard,
                      onChanged: (newValue) {
                        boardList!
                            .asMap()
                            .forEach((key, value) {

                          if (value.board == newValue) {
                            setState(() {
                              selectedBoard = value;
                              dropDownBoard = newValue ?? "";
                            });
                            //getAllGradeByBoard("${selectedBoard!.boardId}");
                          }
                        });
                      },
                      items: boardList!.map((item) {
                        return DropdownMenuItem(
                          value: item.board,
                          child: Text('${item.board}'),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == "Select") return "Please select board";
                        return null;
                      },
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                    child: TextRubikRegular("Class/ Standard/ Grade", "left",
                        16.0, appColors.hintHeadingColor, false),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.mainHeadingColor,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: appColors.errorBorder,width: 1.5),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      isExpanded: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      iconEnabledColor: appColors.mainHeadingColor,
                      hint: Text(
                        'What class does your child studies in ?',
                        style: TextStyle(
                            color: appColors.textFieldHintColor, fontSize: 15),
                      ),
                      value: dropDownGrade,
                      onChanged: (newValue) {
                        gradeList!.asMap().forEach((key, value) {
                          if (value.grade == newValue) {
                            setState(() {
                              selectedGrade = value;
                              dropDownGrade = newValue ?? "";
                            });
                          }
                        });
                      },
                      items:
                      gradeList!.map((item) {
                        return DropdownMenuItem(
                          value: item.grade,
                          child: Text('${item.grade}'),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == "Select") return "Please select grade";
                        return null;
                      },
                    ),
                  ),


                  //hint text
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: TextRubikRegular("Subsciption Details",
                        "left", 18.0, appColors.hintHeadingColor, false),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: TextRubikRegular("Your child is using a free trial",
                          "left", 18.0, appColors.hintHeadingColor, false),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      print("Successs");
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnnualMembershipScreen(userId :"${PreferenceUtils.getString("gabha_user_id")}", flag:"childBuy")),
                        );
                      });

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: TextRubikRegular("Buy Subscription",
                            "left", 18.0, appColors.addChildColor, false),
                      ),
                    ),
                  ),






                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.containerBorderColor,
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 0),
                      textStyle: const TextStyle(
                          fontSize: 14, color: Colors.white)),
                  onPressed: () {
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child:TextRubikRegular(
                            "Save Details ",
                            "left",
                            18.0,
                            Colors.white,
                            false),

                      ),

                    ],
                  )),
            ),
          ],
        ),

      ),


    );
  }
}


