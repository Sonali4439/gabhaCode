
import 'package:gabha_app1/screens/registration/wrapper/UserList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadLogin.g.dart';


@JsonSerializable()
class PayloadLogin {
  @JsonKey(name:"token")
  String? token;

  @JsonKey(name:"user")
  UserList? userList;

  PayloadLogin();


  static const fromJsonFactory=_$PayloadLoginFromJson;
  factory PayloadLogin.fromJson(Map<String,dynamic> json)=>_$PayloadLoginFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadLoginToJson(this);

}
