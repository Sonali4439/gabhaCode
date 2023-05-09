import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/SharedPrefrenceSessionManager.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetStandard.dart';
import 'package:gabha_app1/screens/dashboard/DashboardScreen.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestAddChild.dart';
import 'package:gabha_app1/screens/registration/annualMembershipScreen.dart';
import 'package:gabha_app1/screens/registration/wrapper/Board.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseGetAllBoard.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseRegistration.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';

class ActivityAddChild extends StatefulWidget {
  const ActivityAddChild({Key? key}) : super(key: key);

  @override
  State<ActivityAddChild> createState() => _ActivityAddChildState();
}

class _ActivityAddChildState extends State<ActivityAddChild> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent=true;
  TextEditingController controllerName = TextEditingController();
  List<String> list = <String>['1st', '2nd', '3rd', '4th', '5th'];

  List<String> _board = ['SSC', 'CBSC', 'ICSC', 'IB'];
  String? _selectedBoard;

  List<String> _classNum = ['1st', '2nd', '3rd', '4th'];
  String? _selectedClassNum;

  final formKey = GlobalKey<FormState>();

  Core core = Core();

  List<Board>? boardList = [];
  Board? selectedBoard;
  String? dropDownBoard = "Select";

  List<Grade>? gradeList = [];
  Grade? selectedGrade;
  String? dropDownGrade = "Select";

  List<String>? gradeListData=['Select'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Board board = Board();
    board.board = "Select";
    boardList!.add(board);

    print('---userid-----${PreferenceUtils.getString("gabha_user_id")}');
    print('----name----${PreferenceUtils.getString("gabha_user_name")}');
    onResume();

  }

  onResume() {
    getAllBoard();
  }

  //get all board
  void getAllBoard() async {
    Response<ResponseGetAllBoard> response = await core.getAllBoard();
    if (response.body?.status?.statusCode == 0) {
      setState(() {
        response.body?.payload?.asMap().forEach((key, value) {
          boardList!.add(value);
        });
      });
    }
  }

  //get all grade by borad
  void getAllGradeByBoard(String boardId) async {
    print('----id---${boardId}');
    Response<ResponseGetStandard> response = await core.getAllGradeByBoard(boardId);
    if (response.body?.status?.statusCode == 0) {
      gradeList =[];
      Grade defaultGrade = Grade();
      defaultGrade.gradeId = "";
      defaultGrade.grade = "Select";
      gradeList!.add(defaultGrade);


      setState(() {
        response.body?.payload?.asMap().forEach((key, value) {
          gradeList!.add(value);
        });
      });

      gradeList!.asMap().forEach((key, value) {
        print('----gradeeeeee---${key}===${value.grade}');
      });
    }
  }

  void addChild() async {
    print("ADDDDDDDDDDDDDd child");
    RequestAddChild requestAddChild = RequestAddChild();
    requestAddChild.userId = "${PreferenceUtils.getString("gabha_user_id")}";
    requestAddChild.childName = controllerName.text;
    requestAddChild.gradeId=selectedGrade!.gradeId;
   // requestAddChild.gradeId = "6447c348436f5f4df705dbd3";

    print(requestAddChild.userId);
    print(requestAddChild.childName);
    print(requestAddChild.gradeId);


    Response<ResponseRegistration> response = await core.addChild(requestAddChild);

    if (response.body?.status?.statusCode == 0) {
      print("Successs");
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnnualMembershipScreen(userId :"${response.body?.getPayload()?.userId}", flag:"AddChild")),
        );
      /*  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DashboardScreen()),
        );*/
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
                          TextRubikRegular("Go Back",
                              "left", 18.0, appColors.hintHeadingColor, false),

                        ],
                      ),
                    ),
                  ),
                  // Hey there text
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: TextRubikRegular("Hello ${PreferenceUtils.getString("gabha_user_name")} 👋🏽", "left", 22.0,
                          appColors.mainHeadingColor, true),
                    ),
                  ),

                  //hint text
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: TextRubikRegular(" Add Your Childs Details",
                          "left", 18.0, appColors.hintHeadingColor, false),
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
                            getAllGradeByBoard("${selectedBoard!.boardId}");
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
                      backgroundColor: appColors.mainHeadingColor,
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 0),
                      textStyle: const TextStyle(
                          fontSize: 14, color: Colors.white)),
                  onPressed: () {
                     if (formKey.currentState!.validate()) {

                              addChild();

                      }
                   // addChild();
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


