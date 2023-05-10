

import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';
import 'package:gabha_app1/screens/home/newWrappers/Layout.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';


part 'SubCategoryList.g.dart';


@JsonSerializable()
class SubCategoryList {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"name")
  String? categoryName;

  @JsonKey(name:"language_name")
  String? languageName;

  @JsonKey(name:"position")
  int? position;


  @JsonKey(name:"category")
  CategoryList? categoryList;



  //message field for fail
  @JsonKey(name:"layout")
  Layout? layout;


  //



  SubCategoryList();


  static const fromJsonFactory=_$SubCategoryListFromJson;
  factory SubCategoryList.fromJson(Map<String,dynamic> json)=>_$SubCategoryListFromJson(json);
  Map<String,dynamic>toJson()=>_$SubCategoryListToJson(this);


}

