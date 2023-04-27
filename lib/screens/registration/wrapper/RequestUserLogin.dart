import 'package:json_annotation/json_annotation.dart';

part 'RequestUserLogin.g.dart';


@JsonSerializable()
class RequestUserLogin {

  @JsonKey(name:"mobile_no")
  String? mobileNo;
  @JsonKey(name:"otp")
  String? otp;


  RequestUserLogin();
  static const fromJsonFactory=_$RequestUserLoginFromJson;
  factory RequestUserLogin.fromJson(Map<String,dynamic> json)=>_$RequestUserLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestUserLoginToJson(this);

}

