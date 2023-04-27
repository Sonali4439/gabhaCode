
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';


@JsonSerializable()
class User {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"is_parent")
  bool? isParent;

  @JsonKey(name:"mobile_no")
  String? mobileNo;

  @JsonKey(name:"email")
  String? emailId;

  @JsonKey(name:"mode_of_communication")
  String? modeOfCommunication;

  @JsonKey(name:"child_list")
  List<String>? childList;



  User();

  static const fromJsonFactory=_$UserFromJson;
  factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);
  Map<String,dynamic>toJson()=>_$UserToJson(this);


}

