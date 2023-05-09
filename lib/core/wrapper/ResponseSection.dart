

import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseSection.g.dart';

@JsonSerializable()
class ResponseSection {
  ServerStatus? status;
  List<CategoryList>? payload;

  List<CategoryList>? getPayload() {
    return payload;
  }

  ResponseSection();
  static const fromJsonFactory=_$ResponseSectionFromJson;
  factory ResponseSection.fromJson(Map<String,dynamic> json)=>_$ResponseSectionFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseSectionToJson(this);

}
