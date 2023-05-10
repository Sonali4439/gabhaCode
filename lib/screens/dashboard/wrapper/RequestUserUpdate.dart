

import 'package:json_annotation/json_annotation.dart';

part 'RequestUserUpdate.g.dart';


@JsonSerializable()
class RequestUserUpdate {

  @JsonKey(name:"user_id")
  String? userId;
  @JsonKey(name:"name")
  String? userName;

  @JsonKey(name:"mobile")
  String? mobileNo;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"child_grade_id")
  String? childGradeId;

  @JsonKey(name:"mode_of_communication")
  String? modeOfCommunication;



  RequestUserUpdate();
  static const fromJsonFactory=_$RequestUserUpdateFromJson;
  factory RequestUserUpdate.fromJson(Map<String,dynamic> json)=>_$RequestUserUpdateFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestUserUpdateToJson(this);

}

