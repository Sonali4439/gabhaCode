

import 'package:gabha_app1/screens/home/wrapper/Child.dart';
import 'package:gabha_app1/screens/home/wrapper/ChildDetailsList.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/SubscriptionType.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ChildList.g.dart';


@JsonSerializable()
class ChildList {
  @JsonKey(name:"child")
  Child? child;


  ChildList();


  static const fromJsonFactory=_$ChildListFromJson;
  factory ChildList.fromJson(Map<String,dynamic> json)=>_$ChildListFromJson(json);
  Map<String,dynamic>toJson()=>_$ChildListToJson(this);


}

