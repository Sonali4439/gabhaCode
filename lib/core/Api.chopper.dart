// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Api;

  @override
  Future<Response<ResponseUserLogin>> loginUser(RequestUserLogin request) {
    final $url = 'api/user/userLogin';
    final $body = request;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResponseUserLogin, ResponseUserLogin>($request);
  }

  @override
  Future<Response<ResponseGetAllBoard>> getAllBoard() {
    final $url = 'api/master/getBoard';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ResponseGetAllBoard, ResponseGetAllBoard>($request);
  }

  @override
  Future<Response<ResponseGetAllGradeByBoard>> getAllGradeByBoard(
      String boardId) {
    final $url = 'api/master/getAllGradeByBoard';
    final $params = <String, dynamic>{'board_id': boardId};
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<ResponseGetAllGradeByBoard, ResponseGetAllGradeByBoard>($request);
  }
}
