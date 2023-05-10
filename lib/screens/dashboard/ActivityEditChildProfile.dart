import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gabha_app1/core/Core.dart';
import 'package:gabha_app1/core/SharedPrefrenceSessionManager.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetStandard.dart';
import 'package:gabha_app1/screens/dashboard/DashboardScreen.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestEditChildProfile.dart';
import 'package:gabha_app1/screens/registration/wrapper/Board.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseGetAllBoard.dart';

import '../../constant/AppColors.dart';
import '../../constant/CustomTextFieldWiget.dart';
import '../../constant/TextRubikRegular.dart';
import 'wrapper/ResponseUpdateChild.dart';

class ActivityEditChildProfile extends StatefulWidget {
  const ActivityEditChildProfile({Key? key}) : super(key: key);

  @override
  State<ActivityEditChildProfile> createState() => _ActivityEditChildProfileState();
}

class _ActivityEditChildProfileState extends State<ActivityEditChildProfile> {
  AppColors appColors = AppColors();
  String? mediaValue;
  bool? isParent=true;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobileNum = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
 /* List<String> _board = ['SSC', 'CBSC', 'ICSC', 'IB'];
  String? _selectedBoard;

  List<String> _classNum = ['1st', '2nd', '3rd', '4th'];
  String? _selectedClassNum;*/

  final formKey = GlobalKey<FormState>();

  List<Board>? boardList = [];
  Core core = Core();

  Board? selectedBoard;
  String? dropDownBoard = "Select";

  List<Grade>? gradeList = [];
  Grade? selectedGrade;
  String? dropDownGrade ;

  @override
  void initState() {
    super.initState();
    controllerName.text="${PreferenceUtils.getString("gabha_user_name")}";
    controllerEmail.text="${PreferenceUtils.getString("gabha_email")}";
    controllerMobileNum.text="${PreferenceUtils.getString("gabha_mobile")}";



   // debugPrint("_______gradeid________${PreferenceUtils.getString("grade_id")}");


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
            getAllGradeByBoard("${value.boardId}");
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
      defaultGrade.gradeId = "";
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


  void updateChildUser() async {
    RequestEditChildProfile requestUserUpdate = RequestEditChildProfile();
    requestUserUpdate.userId = "${PreferenceUtils.getString("gabha_user_id")}";
    requestUserUpdate.userName =controllerName.text;
    requestUserUpdate.mobileNo = controllerMobileNum.text;
    requestUserUpdate.email = controllerEmail.text;

    if (selectedGrade ==null)
    {
      requestUserUpdate.gradeId="${PreferenceUtils.getString("grade_id")}";
      print(requestUserUpdate.gradeId);
      print("getttttttttttttt");
    }else{
      requestUserUpdate.gradeId = selectedGrade!.gradeId;
      print(requestUserUpdate.gradeId);
      print("11111111111getttttttttttttt");
    }

    print(requestUserUpdate.userId);
    print(requestUserUpdate.userName);
    print(requestUserUpdate.mobileNo);
    print(requestUserUpdate.email);
    print(requestUserUpdate.gradeId);


    Response<ResponseUpdateChild> response = await core.updateChildUser(requestUserUpdate);
    print(response);

    if (response.body?.status?.statusCode == 0) {
      setState(() {
        print("update child successfulllyyyyyyyyyyyyy");

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
                          TextRubikRegular("Edit Profile",
                              "left", 18.0, appColors.hintHeadingColor, false),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child:Image.asset("assets/images/user_profile.png",)
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
                    padding:
                    const EdgeInsets.only(top: 25, left: 15, right: 15),
                    child: CustomFieldBox(
                        label: "Mobile Number",
                        inputValue: "Enter Mobile Number",
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controllerMobileNum,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) {
                          final regExp =  RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                          final error = value!.isEmpty
                              ? "Enter Mobile Number Here"
                              : null;
                          return (error != null)
                              ? error
                              : regExp.hasMatch(value)
                              ? null
                              : "Enter 10 digit Mobile Number Here";
                        },
                        onChanged: (value) {}),
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25, left: 15, right: 15),
                    child: CustomFieldBox(
                        label: "Email ID",
                        inputValue: "Enter Your Email ID",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controllerEmail,
                        validator: (value) {
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                          );
                          final error = value!.isEmpty
                              ? "Enter Your Email ID here"
                              : null;
                          return (error != null)
                              ? error
                              : emailRegex.hasMatch(value)
                              ? null
                              : "Invalid email";
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
                            updateChildUser();
                          }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child:TextRubikRegular(
                            "Save ",
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



