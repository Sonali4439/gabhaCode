
import 'package:chopper/chopper.dart';
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

import '../screens/registration/wrapper/RequestAddUser.dart';
import '../screens/registration/wrapper/RequestUserLogin.dart';
import '../screens/registration/wrapper/ResponseGetAllBoard.dart';
import '../screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import '../screens/registration/wrapper/ResponseLogin.dart';
part 'Api.chopper.dart';


@ChopperApi(baseUrl: "api")
abstract class Api extends ChopperService {
  static Api create([ChopperClient? client]) {
    return _$Api(client);
  }

  //
  @Post(path:"/user/userLogin")
  Future<Response<ResponseLogin>> loginUser(@Body() RequestUserLogin request);

  @Get(path:"/master/getBoard")
  Future<Response<ResponseGetAllBoard>> getAllBoard();

  @Get(path:"/master/getAllGradeByBoard")
  Future<Response<ResponseGetStandard>> getAllGradeByBoard(@Query('board_id') String boardId);

  @Get(path:"/master/getSubscription")
  Future<Response<ResponseAnnualMembership>> getSubscription(@Query('name') String name,@Query('skip') int skip, @Query('limit') int limit);

  @Get(path:"/category/getCategoryByBoardAndGradeAndUserToken")
  Future<Response<ResponseSection>> getCategoryByBoardAndGradeAndUserToken(@Header('authorization') String token,@Query('board_id') String boardId,@Query('grade_id') String gradeId,@Query('skip') int skip, @Query('limit') int limit);

  @Get(path:"/category/getSubcategoryByCategoryBoardAndGrade")
  Future<Response<ResponseGetSubCategory>> getSubcategoryByCategoryBoardAndGrade(@Header('authorization') String token,@Query('board_id') String boardId,@Query('grade_id') String gradeId,@Query('category_id') String categoryId,@Query('skip') int skip, @Query('limit') int limit);

  @Get(path:"/user/getChildUserList")
  Future<Response<ResponseGetChild>> getChildUserList(@Header('authorization') String token);

  @Get(path:"/user/userSubscription/getUserSubscription")
  Future<Response<ResponseAddUserSubscription>> getSubscriptionByUser(@Header('authorization') String token,@Query('user_id') String childId);


/* @Get(path:"/category/getCategoryByBoardAndGradeAndUserToken")
  Future<Response<ResponseSection>> getCategoryByBoardAndGradeAndUserToken(@Query('board_id') String boardId,@Query('grade_id') String gradeId,@Query('skip') int skip, @Query('limit') int limit);
*/


  @Post(path:"/user/addUser")
  Future<Response<ResponseLogin>> addUser(@Body()RequestAddUser request);

  @Post(path:"/user/userSubscription/addUserSubscription")
  Future<Response<ResponseAddUserSubscription>> addSubscription(@Body()RequestAddSubscription request);

  @Put(path:"/user/updateUser")
  Future<Response<ResponseLogin>> updateUser(@Header('authorization') String token,@Body()RequestUserUpdate request);

  @Put(path:"/user/updateChildUserName")
  Future<Response<ResponseUpdateUserName>> updateUserName(@Header('authorization') String token,@Body()RequestUserNameUpdate request);

  @Post(path:"/category/addChildUserByUser")
  Future<Response<ResponseRegistration>> addChild(@Header('authorization') String token,@Body()RequestAddChild request);




}

