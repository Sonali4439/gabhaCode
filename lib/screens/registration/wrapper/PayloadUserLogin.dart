import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'PayloadUserLogin.g.dart';


@JsonSerializable()
class PayloadUserLogin {
  @JsonKey(name:"token")
  String? token;

  @JsonKey(name:"user")
  User? user;





  PayloadUserLogin();


  static const fromJsonFactory=_$PayloadUserLoginFromJson;
  factory PayloadUserLogin.fromJson(Map<String,dynamic> json)=>_$PayloadUserLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadUserLoginToJson(this);


}

