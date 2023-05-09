

import 'package:gabha_app1/screens/home/wrapper/Child.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ChildDetailsList.g.dart';


@JsonSerializable()
class ChildDetailsList {
  @JsonKey(name:"child")
  Child? child;

  //message field for fail
  @JsonKey(name:"message")
  String? message;


  ChildDetailsList();


  static const fromJsonFactory=_$ChildDetailsListFromJson;
  factory ChildDetailsList.fromJson(Map<String,dynamic> json)=>_$ChildDetailsListFromJson(json);
  Map<String,dynamic>toJson()=>_$ChildDetailsListToJson(this);


}

