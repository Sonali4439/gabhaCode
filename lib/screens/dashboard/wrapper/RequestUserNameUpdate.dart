

import 'package:json_annotation/json_annotation.dart';

part 'RequestUserNameUpdate.g.dart';


@JsonSerializable()
class RequestUserNameUpdate {

  @JsonKey(name:"user_id")
  String? userId;
  @JsonKey(name:"child_name")
  String? childName;


  RequestUserNameUpdate();
  static const fromJsonFactory=_$RequestUserNameUpdateFromJson;
  factory RequestUserNameUpdate.fromJson(Map<String,dynamic> json)=>_$RequestUserNameUpdateFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestUserNameUpdateToJson(this);

}

