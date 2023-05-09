

import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';


part 'CategoryList.g.dart';


@JsonSerializable()
class CategoryList {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"name")
  String? categoryName;

  @JsonKey(name:"language_name")
  String? languageName;

  @JsonKey(name:"position")
  int? position;

  @JsonKey(name:"section")
  int? section;

  @JsonKey(name:"image_filepath")
  String? imageFilepath;

  @JsonKey(name:"grade")
  Grade? grade;



  //message field for fail
  @JsonKey(name:"message")
  String? message;


  CategoryList();


  static const fromJsonFactory=_$CategoryListFromJson;
  factory CategoryList.fromJson(Map<String,dynamic> json)=>_$CategoryListFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoryListToJson(this);


}

