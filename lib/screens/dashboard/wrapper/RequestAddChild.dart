

import 'package:json_annotation/json_annotation.dart';

part 'RequestAddChild.g.dart';


@JsonSerializable()
class RequestAddChild {
  @JsonKey(name:"user_id")
  String? userId;
  @JsonKey(name:"child_name")
  String? childName;
  @JsonKey(name:"grade_id")
  String? gradeId;



  RequestAddChild();
  static const fromJsonFactory=_$RequestAddChildFromJson;
  factory RequestAddChild.fromJson(Map<String,dynamic> json)=>_$RequestAddChildFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestAddChildToJson(this);

}

