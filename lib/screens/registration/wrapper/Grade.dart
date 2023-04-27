
import 'package:json_annotation/json_annotation.dart';

part 'Grade.g.dart';


@JsonSerializable()
class Grade {

  @JsonKey(name:"grade")
  String? grade;

  Grade();


  static const fromJsonFactory=_$GradeFromJson;
  factory Grade.fromJson(Map<String,dynamic> json)=>_$GradeFromJson(json);
  Map<String,dynamic>toJson()=>_$GradeToJson(this);


}

