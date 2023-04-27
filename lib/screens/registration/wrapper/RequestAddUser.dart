

import 'package:json_annotation/json_annotation.dart';

part 'RequestAddUser.g.dart';


@JsonSerializable()
class RequestAddUser {

  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"is_parent")
  bool? isParent;
  @JsonKey(name:"mobile_no")
  String? mobileNo;
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"mode_of_communication")
  String? modeOfCommunication;


  RequestAddUser();
  static const fromJsonFactory=_$RequestAddUserFromJson;
  factory RequestAddUser.fromJson(Map<String,dynamic> json)=>_$RequestAddUserFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestAddUserToJson(this);

}

