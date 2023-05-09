

import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';
import 'package:gabha_app1/screens/home/wrapper/ChildList.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadGetUserChild.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetChild.g.dart';

@JsonSerializable()
class ResponseGetChild {
  ServerStatus? status;
  // ChildList? payload;
  PayloadGetUserChild? payload;

  PayloadGetUserChild? getPayload() {
    return payload;
  }

  ResponseGetChild();
  static const fromJsonFactory=_$ResponseGetChildFromJson;
  factory ResponseGetChild.fromJson(Map<String,dynamic> json)=>_$ResponseGetChildFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseGetChildToJson(this);

}
