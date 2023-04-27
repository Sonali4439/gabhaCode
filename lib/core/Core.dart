import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/registration/wrapper/RequestUserLogin.dart';
import '../screens/registration/wrapper/ResponseGetAllBoard.dart';
import '../screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import '../screens/registration/wrapper/ResponseUserLogin.dart';
import 'Server.dart';
import 'SharedPrefrenceSessionManager.dart';

import 'package:chopper/src/response.dart' as ChopperResponse;





class Core{
  SharedPreferences? prefs;
  // User? currentUser;
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

 /* void updateSession(String? token, User? user) {
    PreferenceUtils.init();
    PreferenceUtils.setString("incent_company_admin_token", token!);
     _storeSession(token, user!);
  }

  void _storeSession(String token, User user) async {
    PreferenceUtils.init();
    currentUser = user;
    token = token;
    PreferenceUtils.setString("incent_company_admin_name", user.yourName.toString());
    PreferenceUtils.setString("incent_company_admin_email", user.emailId.toString());
    PreferenceUtils.setString("incent_company_admin_mobile", user.mobileNo.toString());
    PreferenceUtils.setBool("incent_company_admin_is_set_password", user.isSetPassword ?? false);

  }

  logout() async {
    PreferenceUtils.init();
    PreferenceUtils.remove("incent_company_admin_token");
    PreferenceUtils.remove("incent_company_admin_name");
    PreferenceUtils.remove("incent_company_admin_email");
    PreferenceUtils.remove("incent_company_admin_mobile");
    PreferenceUtils.remove("incent_company_admin_is_set_password");
    currentUser = null;
  }*/


  Future<String?> getToken() async {
    PreferenceUtils.init();
    return PreferenceUtils.getString("incent_company_admin_token");
  }

  Future<bool> isSetPassword() async {
    PreferenceUtils.init();
    return PreferenceUtils.getBool("incent_company_admin_is_set_password");
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
  Future<ChopperResponse.Response<ResponseUserLogin>> loginUser(RequestUserLogin request) {
    return server.loginUser(request);
  }

  //master -2-getBoard
  Future<ChopperResponse.Response<ResponseGetAllBoard>> getAllBoard() {
    return server.getAllBoard();
  }

  //master -13-getAllGradeByBoard
  Future<ChopperResponse.Response<ResponseGetAllGradeByBoard>> getAllGradeByBoard(String boardId) {
    return server.getAllGradeByBoard(boardId);
  }










}

