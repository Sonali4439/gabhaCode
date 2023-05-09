
import 'package:gabha_app1/screens/registration/wrapper/UserList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadUpdateUserName.g.dart';


@JsonSerializable()
class PayloadUpdateUserName {
  @JsonKey(name:"message")
  String? message;

  PayloadUpdateUserName();


  static const fromJsonFactory=_$PayloadUpdateUserNameFromJson;
  factory PayloadUpdateUserName.fromJson(Map<String,dynamic> json)=>_$PayloadUpdateUserNameFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadUpdateUserNameToJson(this);

}
