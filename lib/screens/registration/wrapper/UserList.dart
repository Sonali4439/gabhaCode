
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../home/wrapper/ChildList.dart';


part 'UserList.g.dart';


@JsonSerializable()
class UserList {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"name")
  String? useName;

  @JsonKey(name:"is_parent")
  bool? isParent;

  @JsonKey(name:"mobile_no")
  String? mobileNumber;

  @JsonKey(name:"email")
  String? emailID;

  @JsonKey(name:"mode_of_communication")
  String? modeOfCommunication;

  @JsonKey(name:"child_list")
  List<ChildList>? childList;

  @JsonKey(name:"grade")
  Grade? grade;

  /*@JsonKey(name:"child_list")
  List<ChildListes>? childListt;*/




  UserList();

  static const fromJsonFactory=_$UserListFromJson;
  factory UserList.fromJson(Map<String,dynamic> json)=>_$UserListFromJson(json);
  Map<String,dynamic>toJson()=>_$UserListToJson(this);


}