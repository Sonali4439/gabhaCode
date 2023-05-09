

import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadAddUserSubscription.dart';
import 'package:json_annotation/json_annotation.dart';


part 'Child.g.dart';


@JsonSerializable()
class Child {
  @JsonKey(name:"child_id")
  String? childId;
  @JsonKey(name:"child_name")
  String? childName;
  @JsonKey(name:"mobile_no")
  String? mobileNo;

  @JsonKey(name:"user_subscription")
  PayloadAddUserSubscription? userSubscription;






  //message field for fail
  @JsonKey(name:"message")
  String? message;


  Child();


  static const fromJsonFactory=_$ChildFromJson;
  factory Child.fromJson(Map<String,dynamic> json)=>_$ChildFromJson(json);
  Map<String,dynamic>toJson()=>_$ChildToJson(this);


}

