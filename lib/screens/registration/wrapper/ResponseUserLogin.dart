import 'package:json_annotation/json_annotation.dart';

import 'PayloadUserLogin.dart';
import 'ServerStatus.dart';

part 'ResponseUserLogin.g.dart';

@JsonSerializable()
class ResponseUserLogin {
  ServerStatus? status;
  PayloadUserLogin? payload;

  PayloadUserLogin? getPayload() {
    return payload;
  }



  ResponseUserLogin();
  static const fromJsonFactory=_$ResponseUserLoginFromJson;
  factory ResponseUserLogin.fromJson(Map<String,dynamic> json)=>_$ResponseUserLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseUserLoginToJson(this);

}
