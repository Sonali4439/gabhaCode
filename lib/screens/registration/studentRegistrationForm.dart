import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:gabha_app1/core/SharedPrefrenceSessionManager.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetStandard.dart';
import 'package:gabha_app1/screens/registration/wrapper/Board.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/RequestAddUser.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseGetAllBoard.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseRegistration.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomTextButton.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';
import '../../core/Core.dart';
import 'annualMembershipScreen.dart';

class StudentRegistrationForm extends StatefulWidget {
  String fullName,mobile,email,modeOfCommunication;
  final bool? isParents;
  StudentRegistrationForm({required this.fullName,required this.mobile,required this.email,
   required this.modeOfCommunication, required this.isParents});
 // const StudentRegistrationForm({Key? key}) : super(key: key);

  @override
  State<StudentRegistrationForm> createState() => _StudentRegistrationFormState();
}

class _StudentRegistrationFormState extends State<StudentRegistrationForm> {
  AppColors appColors = AppColors();

  List<String> list = <String>['1st', '2nd', '3rd', '4th', '5th'];

 /* List<String> _board = ['SSC', 'CBSC', 'ICSC', 'IB'];
  String? _selectedBoard;*/

  /*List<String> _classNum = ['1st', '2nd', '3rd', '4th'];
  String? _selectedClassNum;*/
  Core core = Core();

  List<Board>? boardList = [];
  Board? selectedBoard;
  String? dropDownBoard = "Select";

  List<Grade>? gradeList = [];
  Grade? selectedGrade;
  String? dropDownGrade = "Select";

  // List<String>? gradeListData=['Select'];



  TextEditingController controllerChildName = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Board board = Board();
    board.board = "Select";
    boardList!.add(board);

    onResume();

  }

  onResume() {
    getAllBoard();
  }

  void addUser() async {
    print("ADDDDDDDDDDDDDd");
    RequestAddUser requestAddUser = RequestAddUser();
    requestAddUser.name = widget.fullName;
    requestAddUser.mobileNo = widget.mobile;
    requestAddUser.email = widget.email;
    requestAddUser.modeOfCommunication = widget.modeOfCommunication;
    requestAddUser.isParent = widget.isParents;
    requestAddUser.childName=controllerChildName.text;
    requestAddUser.childGradeId=selectedGrade!.gradeId;

    /*if(widget.isParents ==true)
      {
        requestAddUser.gradeId="6447c348436f5f4df705dbd3";
      }else{
      requestAddUser.childGradeId="642fab761045f4c64aaf3856";
    }*/

    print(requestAddUser.name);
    print(requestAddUser.mobileNo);
    print(requestAddUser.isParent);
    print(requestAddUser.childGradeId);

    Response<ResponseLogin> response = await core.addUser(requestAddUser);

    if (response.body?.status?.statusCode == 0) {

      if(response.body?.getPayload()?.userList != null){

        core.updateSession(response.body?.getPayload()?.token, response.body?.getPayload()?.userList);

        debugPrint(response.body?.getPayload()?.userList!.id);
        debugPrint("user id is-----------------");
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  AnnualMembershipScreen(userId :"${response.body?.getPayload()?.userList!.id}",flag:"Registration")),
          );
        });
      }


    }




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
    debugPrint('----id---${boardId}');
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

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    print("name-------${widget.fullName}");
    print("mobile-------${widget.mobile}");
    print("email-------${widget.email}");
    print("modeOfcomm-------${widget.modeOfCommunication}");
    print("isparent-------${widget.isParents}");



    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //progress bar
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: LinearPercentIndicator(
                      // width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2000,
                      percent: 0.7,
                      backgroundColor: appColors.progressColor,
                      barRadius: const Radius.circular(16),
                      progressColor: appColors.mainHeadingColor,
                    ),
                  ),

                  // Hey there text
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: TextRubikRegular("Hello ${widget.fullName} 👋🏽", "left", 22.0,
                          appColors.mainHeadingColor, true),
                    ),
                  ),

                  //hint text

                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: TextRubikRegular(
                         widget.isParents ==true
                        ? " Add Your Childs Details" : "Fill Your Details",
                           "left",
                          16.0, appColors.hintHeadingColor, false),
                    ),
                  ),

                  widget.isParents ==true
                 ? Padding(
                    padding:
                    const EdgeInsets.only(top: 40),
                    child: CustomFieldBox(
                        label: "Full Name",
                        inputValue: "Enter Full Name of your Child",
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controllerChildName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Full Name of your Child Here";
                          }
                          return null;
                        },
                        onChanged: (value) {}),
                  )
                  : Container(),




                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextRubikRegular("Board", "left", 16.0,
                        appColors.hintHeadingColor, false),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
                    padding: const EdgeInsets.only(top: 30),
                    child: TextRubikRegular("Class/ Standard/ Grade", "left",
                        16.0, appColors.hintHeadingColor, false),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20),
              child: Center(
                child: TextRubikRegular(
                    ( widget.isParents == "true")
                        ? " Note : You can always add a New Child later in your Profile" : "",
                    "center",
                    16.0, appColors.hintHeadingColor, false),
              ),
            ),
            CustomTextButton(
              buttonColor: appColors.mainHeadingColor,
              onPressed: () {
                print("button presss");
               // addUser();
                if (formKey.currentState!.validate()) {
                    addUser();

                }
              /*  addUser();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnnualMembershipScreen()),
                );*/
              },
              title: "Save & Proceed",
              paddingSize: 15,
              iconName: Icon(Icons.arrow_forward,color: Colors.white,size: 28,),
            ),
          ],
        ),
      ),

     /* Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            *//* Padding(
              padding: const EdgeInsets.only(top: 60,bottom: 20),
              child: Center(
                child: TextRubikRegular("Note : You can always add a new child in your proile", "left",
                    14.0, appColors.subHeadingColor, false),
              ),
            ),*//*
            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                   *//* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityAnnualMembership()),
                    );*//*
                  }
                },
                child: ButtonFilledGreen(
                    MediaQuery.of(context).size.width, 50, "Save & Proceed")),
          ],
        ),
      ),*/
    );
  }
}
