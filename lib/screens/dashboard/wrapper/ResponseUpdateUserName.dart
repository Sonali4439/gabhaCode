
import 'package:gabha_app1/screens/dashboard/wrapper/PayloadUpdateUserName.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseUpdateUserName.g.dart';

@JsonSerializable()
class ResponseUpdateUserName {
  ServerStatus? status;
  PayloadUpdateUserName? payload;

  PayloadUpdateUserName? getPayload() {
    return payload;
  }

  ResponseUpdateUserName();
  static const fromJsonFactory=_$ResponseUpdateUserNameFromJson;
  factory ResponseUpdateUserName.fromJson(Map<String,dynamic> json)=>_$ResponseUpdateUserNameFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseUpdateUserNameToJson(this);

}
