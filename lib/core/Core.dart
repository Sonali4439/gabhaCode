import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetStandard.dart';
import 'package:gabha_app1/core/wrapper/ResponseGetSubCategory.dart';
import 'package:gabha_app1/core/wrapper/ResponseSection.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestAddChild.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestUserNameUpdate.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/RequestUserUpdate.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/ResponseUpdateUserName.dart';
import 'package:gabha_app1/screens/home/wrapper/ResponseGetChild.dart';
import 'package:gabha_app1/screens/registration/wrapper/RequestAddSubscription.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAddUserSubscription.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseAnnualMembership.dart';
import 'package:gabha_app1/screens/registration/wrapper/ResponseRegistration.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/registration/wrapper/RequestAddUser.dart';
import '../screens/registration/wrapper/RequestUserLogin.dart';
import '../screens/registration/wrapper/ResponseGetAllBoard.dart';
import '../screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import '../screens/registration/wrapper/ResponseLogin.dart';
import '../screens/registration/wrapper/UserList.dart';
import 'Server.dart';
import 'SharedPrefrenceSessionManager.dart';

import 'package:chopper/src/response.dart' as ChopperResponse;





class Core{
  SharedPreferences? prefs;
  UserList? currentUser;
  String? token;
  String? userFirebaseToken ;
  int reward = 10;
  int coreCouponDialog = 0;
  File? userProfileImage;
  DateTime? loginClickTime;
  bool isInternet=true;
  Server server = Server();

  bool isInitialized = false;

  var onInitComplete;
  
  bool getConnectionValue(var connectivityResult) {
    bool status;
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = true;
        break;
      case ConnectivityResult.wifi:
        status = true;
        break;
      case ConnectivityResult.none:
        status = false;
        break;
      default:
        status = false;
        break;
    }
    return status;
  }

  void showMessage(String? msg){
    // Fluttertoast.showToast(
    //     msg: msg ?? "",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.grey,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  void updateSession(String? token, UserList? user) {
    PreferenceUtils.init();
    PreferenceUtils.setString("gabha_token", token!);
    PreferenceUtils.setString("gabha_user_id", user!.id.toString());
    PreferenceUtils.setString("gabha_user_name", user.useName.toString());
    PreferenceUtils.setString("gabha_email", user.emailID.toString());
    PreferenceUtils.setString("gabha_mobile", user.mobileNumber.toString());
    PreferenceUtils.setString("gabha_isParent", user.isParent.toString());
    PreferenceUtils.setString("gabha_modeOfCommunication", user.modeOfCommunication.toString());
    // PreferenceUtils.setString("gabha_user_image", user..toString());
    PreferenceUtils.setString("grade_id", user.grade!.gradeId.toString());
    PreferenceUtils.setString("board_id", user.grade!.board!.boardId.toString());
    PreferenceUtils.setString("grade_name", user.grade!.grade.toString());
    PreferenceUtils.setString("board_name", user.grade!.board!.boardShortName.toString());
    PreferenceUtils.setString("board_full_name", user.grade!.board!.board.toString());
     _storeSession(token, user);
  }

  void _storeSession(String token, UserList user) async {
    PreferenceUtils.init();
    currentUser = user;
    token = token;
    PreferenceUtils.setString("gabha_user_id", user.id.toString());
    PreferenceUtils.setString("gabha_user_name", user.useName.toString());
    PreferenceUtils.setString("gabha_email", user.emailID.toString());
    PreferenceUtils.setString("gabha_mobile", user.mobileNumber.toString());
    PreferenceUtils.setString("gabha_isParent", user.isParent.toString());
    PreferenceUtils.setString("gabha_modeOfCommunication", user.modeOfCommunication.toString());
   // PreferenceUtils.setString("gabha_user_image", user..toString());
    PreferenceUtils.setString("grade_id", user.grade!.gradeId.toString());
    PreferenceUtils.setString("board_id", user.grade!.board!.boardId.toString());
    PreferenceUtils.setString("grade_name", user.grade!.grade.toString());
    PreferenceUtils.setString("board_name", user.grade!.board!.boardShortName.toString());
    PreferenceUtils.setString("board_full_name", user.grade!.board!.board.toString());
  }

  logout() async {
    PreferenceUtils.init();
    PreferenceUtils.remove("gabha_token");
    PreferenceUtils.remove("gabha_user_id");
    PreferenceUtils.remove("gabha_user_name");
    PreferenceUtils.remove("gabha_email");
    PreferenceUtils.remove("gabha_mobile");
    PreferenceUtils.remove("gabha_isParent");
    PreferenceUtils.remove("grade_id");
    PreferenceUtils.remove("board_id");
    PreferenceUtils.remove("grade_name");
    PreferenceUtils.remove("board_name");
    PreferenceUtils.remove("board_full_name");

    currentUser = null;
  }


  Future<String?> getToken() async {
    PreferenceUtils.init();
    return PreferenceUtils.getString("gabha_token");
  }

  Future<bool> isSetPassword() async {
    PreferenceUtils.init();
    return PreferenceUtils.getBool("gabha_is_set_password");
  }

  bool isUserLoggedIn() {
    print("core token==${token}");
    PreferenceUtils.init();
    print("token====${PreferenceUtils.getString("gabha_token")}");
    return null != token;
  }

  //new code v2
 /* User? getCurrentUser() {
    User currentUserNew = User();
    currentUserNew.yourName = PreferenceUtils.getString("incent_company_admin_name");
    currentUserNew.emailId = PreferenceUtils.getString("incent_company_admin_email");
    currentUserNew.mobileNo = PreferenceUtils.getString("incent_company_admin_mobile");
    return currentUserNew;
  }*/

  bool isRedundentClick(DateTime currentTime){
    if(loginClickTime==null){
      loginClickTime = currentTime;
      print("first click");
      return false;
    }
    print('diff is ${currentTime.difference(loginClickTime!).inSeconds}');
    if(currentTime.difference(loginClickTime!).inSeconds<5){//set this difference time in seconds
      return true;
    }
    loginClickTime = currentTime;
    return false;
  }
  /*void setCurrentUser(User? user) {
    currentUser = user;
    _storeSession(getToken().toString(), user!);
  }*/




 //  void storeFirebaseToken(String firebaseToken) async {
 //    print("Store firebase token===${firebaseToken}");
 //    PreferenceUtils.init();
 //    PreferenceUtils.setString("pebbles_user_firebase_token", firebaseToken);
 //    //_prefs?.setString("pebbles_user_firebase_token", firebaseToken ?? '');
 //    userFirebaseToken = firebaseToken;
 //  }
 //  removeFirebaseToken() async {
 //    PreferenceUtils.init();
 //    PreferenceUtils.remove("pebbles_user_firebase_token");
 //    prefs?.remove("pebbles_user_firebase_token");
 //    userFirebaseToken = null;
 //  }
 //
 //  String? getUserFirebaseToken()  {
 //    PreferenceUtils.init();
 // //   print("User Firebase Token===${PreferenceUtils.getString("pebbles_user_firebase_token")}");
 //    if(PreferenceUtils.getString("pebbles_user_firebase_token") != null) {
 //      return PreferenceUtils.getString("pebbles_user_firebase_token");
 //    }
 //  }


  // void _getSession() async {
  //   User currentUser = User();
  //   currentUser.name = PreferenceUtils.getString("pebbles_user_name");//_prefs?.getString("pebbles_user_name");
  //   // currentUser.email = PreferenceUtils.getString("pebbles_user_email");//_prefs?.getString("pebbles_user_email");
  //   // currentUser.phone =PreferenceUtils.getString("pebbles_user_phone"); //_prefs?.getString("pebbles_user_phone");
  //   currentUser = currentUser;
  //   isInitialized = true;
  //   if (null != onInitComplete) {
  //     onInitComplete();
  //   }
  // }


  //Convert server date to display date
  String convertServerDateToString(String? serverDate){
    return DateFormat('EEEE, d MMM yyyy').format(DateFormat("yyyy-MM-dd").parse(serverDate?? ""));
  }
  String convertServerDateToDateddmmyy(String? serverDate){
    return DateFormat('dd MMM yyyy').format(DateFormat("yyyy-MM-dd").parse(serverDate?? ""));
  }
  String convertDateToYYYYMMDD(String? serverDate){
    return DateFormat('yyyy-MM-dd').format(DateFormat("yyyy-MM-dd").parse(serverDate?? ""));
  }

  String convertServerDateToTimeddmmyy(String? serverDate){
    return DateFormat('hh:mm a').format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z").parse(serverDate?? ""));
  }


  String convertServerTimeToTimehhmma(String? time) {
    int h = int.parse(time!.split(":").first);
    int m = int.parse(time.split(":").last.split(" ").first);
    String send = "";
    if (h > 12) {
      var temp = h - 12;
      send = "0$temp:${m.toString().length == 1 ? "0" + m.toString() : m.toString()} " + "PM";
    } else {
      send = "$h:${m.toString().length == 1 ? "0" + m.toString() : m.toString()}  " + "AM";
    }
    return send;
  }


  // user -4- userLogin
  Future<ChopperResponse.Response<ResponseLogin>> loginUser(RequestUserLogin request) {
    return server.loginUser(request);
  }

  //master -2-getBoard
  Future<ChopperResponse.Response<ResponseGetAllBoard>> getAllBoard() {
    return server.getAllBoard();
  }

  //user- 1-adduser
  Future<ChopperResponse.Response<ResponseLogin>> addUser(RequestAddUser request) {
    return server.addUser(request);
  }

  //user- 6-addUserSubscription
  Future<ChopperResponse.Response<ResponseAddUserSubscription>> addSubscription(RequestAddSubscription request) {
    return server.addSubscription(request);
  }

  //user- 5-addChildUserByUser
  Future<ChopperResponse.Response<ResponseRegistration>> addChild(RequestAddChild request) {
    return server.addChild("Bearer ${PreferenceUtils.getString("gabha_token")}",request);
  }


  //master -13-getAllGradeByBoard
  Future<ChopperResponse.Response<ResponseGetStandard>> getAllGradeByBoard(String boardId) {
    return server.getAllGradeByBoard(boardId);
  }

  //master -23-getSubscription
  Future<ChopperResponse.Response<ResponseAnnualMembership>> getSubscription(String name,int skip,int limit) {
    return server.getSubscription(name,skip,limit);
  }

  //user- 2-updateUSer
  Future<ChopperResponse.Response<ResponseLogin>> updateUser(RequestUserUpdate request) {
    return server.updateUser("Bearer ${PreferenceUtils.getString("gabha_token")}",request);
  }

  //user- 11-updateChildUserName
  Future<ChopperResponse.Response<ResponseUpdateUserName>> updateUserName(RequestUserNameUpdate request) {
    return server.updateUserName("Bearer ${PreferenceUtils.getString("gabha_token")}",request);
  }

  //17-caterogy -getCategoryByBoardAndGradeAndUserToken  (user APi)
  Future<ChopperResponse.Response<ResponseSection>> getCategoryByBoardAndGradeAndUserToken(String boardId,String gradeId,int skip,int limit) {
    print('hiii------${PreferenceUtils.getString("gabha_token")}');
    return server.getCategoryByBoardAndGradeAndUserToken("Bearer ${PreferenceUtils.getString("gabha_token")}",boardId,gradeId,skip,limit);
  }

  //18-caterogy -getSubcategoryByCategoryBoardAndGrade  (user APi)
  Future<ChopperResponse.Response<ResponseGetSubCategory>> getSubcategoryByCategoryBoardAndGrade(String boardId,String gradeId,String categoryId,int skip,int limit) {
    print('hiii------${PreferenceUtils.getString("gabha_token")}');
    return server.getSubcategoryByCategoryBoardAndGrade("Bearer ${PreferenceUtils.getString("gabha_token")}",boardId,gradeId,categoryId,skip,limit);
  }

  //10-user-getChildUserList
  Future<ChopperResponse.Response<ResponseGetChild>> getChildUserList() {
    return server.getChildUserList("Bearer ${PreferenceUtils.getString("gabha_token")}");
  }

  //7-user -getUserSubscription
  Future<ChopperResponse.Response<ResponseAddUserSubscription>> getSubscriptionByUser(String childId) {
    return server.getSubscriptionByUser("Bearer ${PreferenceUtils.getString("gabha_token")}",childId);
  }















}

