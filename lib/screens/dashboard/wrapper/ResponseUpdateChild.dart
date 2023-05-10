
import 'package:gabha_app1/screens/dashboard/wrapper/PayloadUpdateChild.dart';
import 'package:gabha_app1/screens/dashboard/wrapper/PayloadUpdateUserName.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseUpdateChild.g.dart';

@JsonSerializable()
class ResponseUpdateChild {
  ServerStatus? status;
  PayloadUpdateChild? payload;

  PayloadUpdateChild? getPayload() {
    return payload;
  }

  ResponseUpdateChild();
  static const fromJsonFactory=_$ResponseUpdateChildFromJson;
  factory ResponseUpdateChild.fromJson(Map<String,dynamic> json)=>_$ResponseUpdateChildFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseUpdateChildToJson(this);

}
