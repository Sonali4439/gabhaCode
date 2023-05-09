
import 'package:gabha_app1/screens/registration/wrapper/PayloadLogin.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadRegistration.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseRegistration.g.dart';

@JsonSerializable()
class ResponseRegistration {
  ServerStatus? status;
  PayloadRegistration? payload;

  PayloadRegistration? getPayload() {
    return payload;
  }

  ResponseRegistration();
  static const fromJsonFactory=_$ResponseRegistrationFromJson;
  factory ResponseRegistration.fromJson(Map<String,dynamic> json)=>_$ResponseRegistrationFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseRegistrationToJson(this);

}
