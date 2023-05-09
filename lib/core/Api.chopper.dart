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
  Future<Response<ResponseLogin>> loginUser(RequestUserLogin request) {
    final $url = 'api/user/userLogin';
    final $body = request;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResponseLogin, ResponseLogin>($request);
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
  Future<Response<ResponseGetStandard>> getAllGradeByBoard(String boardId) {
    final $url = 'api/master/getAllGradeByBoard';
    final $params = <String, dynamic>{'board_id': boardId};
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ResponseGetStandard, ResponseGetStandard>($request);
  }

  @override
  Future<Response<ResponseAnnualMembership>> getSubscription(
    String name,
    int skip,
    int limit,
  ) {
    final $url = 'api/master/getSubscription';
    final $params = <String, dynamic>{
      'name': name,
      'skip': skip,
      'limit': limit,
    };
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<ResponseAnnualMembership, ResponseAnnualMembership>($request);
  }

  @override
  Future<Response<ResponseSection>> getCategoryByBoardAndGradeAndUserToken(
    String token,
    String boardId,
    String gradeId,
    int skip,
    int limit,
  ) {
    final $url = 'api/category/getCategoryByBoardAndGradeAndUserToken';
    final $params = <String, dynamic>{
      'board_id': boardId,
      'grade_id': gradeId,
      'skip': skip,
      'limit': limit,
    };
    final $headers = {
      'authorization': token,
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ResponseSection, ResponseSection>($request);
  }

  @override
  Future<Response<ResponseGetSubCategory>>
      getSubcategoryByCategoryBoardAndGrade(
    String token,
    String boardId,
    String gradeId,
    String categoryId,
    int skip,
    int limit,
  ) {
    final $url = 'api/category/getSubcategoryByCategoryBoardAndGrade';
    final $params = <String, dynamic>{
      'board_id': boardId,
      'grade_id': gradeId,
      'category_id': categoryId,
      'skip': skip,
      'limit': limit,
    };
    final $headers = {
      'authorization': token,
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<ResponseGetSubCategory, ResponseGetSubCategory>($request);
  }

  @override
  Future<Response<ResponseGetChild>> getChildUserList(String token) {
    final $url = 'api/user/getChildUserList';
    final $headers = {
      'authorization': token,
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ResponseGetChild, ResponseGetChild>($request);
  }

  @override
  Future<Response<ResponseAddUserSubscription>> getSubscriptionByUser(
    String token,
    String childId,
  ) {
    final $url = 'api/user/userSubscription/getUserSubscription';
    final $params = <String, dynamic>{'user_id': childId};
    final $headers = {
      'authorization': token,
    };

    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<ResponseAddUserSubscription,
        ResponseAddUserSubscription>($request);
  }

  @override
  Future<Response<ResponseLogin>> addUser(RequestAddUser request) {
    final $url = 'api/user/addUser';
    final $body = request;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResponseLogin, ResponseLogin>($request);
  }

  @override
  Future<Response<ResponseAddUserSubscription>> addSubscription(
      RequestAddSubscription request) {
    final $url = 'api/user/userSubscription/addUserSubscription';
    final $body = request;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResponseAddUserSubscription,
        ResponseAddUserSubscription>($request);
  }

  @override
  Future<Response<ResponseLogin>> updateUser(
    String token,
    RequestUserUpdate request,
  ) {
    final $url = 'api/user/updateUser';
    final $headers = {
      'authorization': token,
    };

    final $body = request;
    final $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ResponseLogin, ResponseLogin>($request);
  }

  @override
  Future<Response<ResponseUpdateUserName>> updateUserName(
    String token,
    RequestUserNameUpdate request,
  ) {
    final $url = 'api/user/updateChildUserName';
    final $headers = {
      'authorization': token,
    };

    final $body = request;
    final $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<ResponseUpdateUserName, ResponseUpdateUserName>($request);
  }

  @override
  Future<Response<ResponseRegistration>> addChild(
    String token,
    RequestAddChild request,
  ) {
    final $url = 'api/category/addChildUserByUser';
    final $headers = {
      'authorization': token,
    };

    final $body = request;
    final $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ResponseRegistration, ResponseRegistration>($request);
  }
}
