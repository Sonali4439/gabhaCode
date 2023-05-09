

import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';


part 'AcademicYear.g.dart';


@JsonSerializable()
class AcademicYear {
  @JsonKey(name:"_id")
  String? id;


  @JsonKey(name:"grade")
  Grade? grade;

  @JsonKey(name:"start_date")
  String? startAcademicDate;

  @JsonKey(name:"end_date")
  String? endAcademicDate;

  //message field for fail
  @JsonKey(name:"message")
  String? message;


  AcademicYear();


  static const fromJsonFactory=_$AcademicYearFromJson;
  factory AcademicYear.fromJson(Map<String,dynamic> json)=>_$AcademicYearFromJson(json);
  Map<String,dynamic>toJson()=>_$AcademicYearToJson(this);


}

