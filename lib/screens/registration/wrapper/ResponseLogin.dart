
import 'package:gabha_app1/screens/registration/wrapper/PayloadLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseLogin.g.dart';

@JsonSerializable()
class ResponseLogin {
  ServerStatus? status;
  PayloadLogin? payload;

  PayloadLogin? getPayload() {
    return payload;
  }

  ResponseLogin();
  static const fromJsonFactory=_$ResponseLoginFromJson;
  factory ResponseLogin.fromJson(Map<String,dynamic> json)=>_$ResponseLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseLoginToJson(this);

}
