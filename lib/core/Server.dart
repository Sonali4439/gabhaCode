import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;

import '../screens/registration/wrapper/RequestUserLogin.dart';
import '../screens/registration/wrapper/ResponseGetAllBoard.dart';
import '../screens/registration/wrapper/ResponseGetAllGradeByBoard.dart';
import '../screens/registration/wrapper/ResponseSuccess.dart';
import '../screens/registration/wrapper/ResponseUserLogin.dart';
import 'Api.dart';



class Server {
  Api? api;
  String tokenMain = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOnsiaWQiOiI2M2U2MjUxNWQzMmQ4NmQ4NTY3NjAyMTgifSwiaWF0IjoxNjc2MzcxMjc0fQ.eXehFXKo9KAN5-c1Kv81wejsVVGJE2gy_B9tHmEVGno";

  //development
  // static const  String BASE_URL = "https://devnfapi.naturefit.in";
  //production
  // static final  String baseURL = "http://3.138.42.108:3000"; //aws
  // static const  String baseURL = "http://15.206.222.49:3000"; //aws

  //development
  static const  String baseURL = "http://15.206.222.49:3002"; //aws

  //uat
  // static const  String baseURL = "http://3.109.198.242:3000";//aws

  Server() {
    final converter = JsonSerializableConverter(const {
      ResponseSuccess: ResponseSuccess.fromJsonFactory,
      ResponseUserLogin: ResponseUserLogin.fromJsonFactory,
      ResponseGetAllBoard: ResponseGetAllBoard.fromJsonFactory,
      ResponseGetAllGradeByBoard :ResponseGetAllGradeByBoard.fromJsonFactory,

    });

    final chopper = ChopperClient(
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 60),
        ),
        baseUrl: baseURL,
        interceptors: [
          (Request req) async {
            chopperLogger.info('${req.headers}');
            // VERY VERY IMPORTANT TO RETURN req
            return req;
          }
        ],
        services: [
          // Create and pass an instance of the generated service to the client
          Api.create(),
        ],
        converter: converter
        // converter: JsonConverter(),
        );
    api = chopper.getService<Api>();
  }

  Future<Response<ResponseUserLogin>> loginUser(RequestUserLogin request) async {
    Response<ResponseUserLogin> response = await api!.loginUser(request);
    return response;
  }

  Future<Response<ResponseGetAllBoard>> getAllBoard() async {
    Response<ResponseGetAllBoard> response = await api!.getAllBoard();
    return response;
  }

  Future<Response<ResponseGetAllGradeByBoard>> getAllGradeByBoard(String boardId) async {
    Response<ResponseGetAllGradeByBoard> response = await api!.getAllGradeByBoard(boardId);
    return response;
  }





}

typedef T JsonFactory<T>(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T? _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw .fromJsonFactory, not found error;
      return null;
    }

    return jsonFactory(values);
  }

  Iterable<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    inspect(entity);
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);
    inspect(jsonRes.body);
    print("========= START RESPONSE =======");
    print("URL : " + "${response.base.request!.url}");
    print("HEADERS : " + "${response.base.request!.headers.toString()}");
    print("Response Code : " + "${response.statusCode.toString}");
    print("Response Body : " + response.body);
    print("========= END RESPONSE =========");
    return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) => super.convertRequest(request);


}
