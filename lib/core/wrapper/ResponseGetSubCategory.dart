

import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';
import 'package:gabha_app1/screens/home/wrapper/SubCategoryList.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetSubCategory.g.dart';

@JsonSerializable()
class ResponseGetSubCategory {
  ServerStatus? status;
  List<SubCategoryList>? payload;

  List<SubCategoryList>? getPayload() {
    return payload;
  }

  ResponseGetSubCategory();
  static const fromJsonFactory=_$ResponseGetSubCategoryFromJson;
  factory ResponseGetSubCategory.fromJson(Map<String,dynamic> json)=>_$ResponseGetSubCategoryFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseGetSubCategoryToJson(this);

}
