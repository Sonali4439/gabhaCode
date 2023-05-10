

import 'package:json_annotation/json_annotation.dart';

part 'RequestEditChildProfile.g.dart';


@JsonSerializable()
class RequestEditChildProfile {

  @JsonKey(name:"user_id")
  String? userId;
  @JsonKey(name:"name")
  String? userName;

  @JsonKey(name:"mobile")
  String? mobileNo;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"grade_id")
  String? gradeId;



  RequestEditChildProfile();
  static const fromJsonFactory=_$RequestEditChildProfileFromJson;
  factory RequestEditChildProfile.fromJson(Map<String,dynamic> json)=>_$RequestEditChildProfileFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestEditChildProfileToJson(this);

}

