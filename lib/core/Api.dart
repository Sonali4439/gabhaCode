
import 'package:chopper/chopper.dart';

import '../screens/registration/wrapper/RequestUserLogin.dart';
import '../screens/registration/wrapper/ResponseGetAllBoard.dart';
import '../screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import '../screens/registration/wrapper/ResponseUserLogin.dart';
part 'Api.chopper.dart';


@ChopperApi(baseUrl: "api")
abstract class Api extends ChopperService {
  static Api create([ChopperClient? client]) {
    return _$Api(client);
  }

  //
  @Post(path:"/user/userLogin")
  Future<Response<ResponseUserLogin>> loginUser(@Body() RequestUserLogin request);

  @Get(path:"/master/getBoard")
  Future<Response<ResponseGetAllBoard>> getAllBoard();

  @Get(path:"/master/getAllGradeByBoard")
  Future<Response<ResponseGetAllGradeByBoard>> getAllGradeByBoard(@Query('board_id') String boardId);




}

