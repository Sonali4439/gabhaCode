
import 'package:gabha_app1/screens/registration/wrapper/Board.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Grade.g.dart';


@JsonSerializable()
class Grade {

  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"grade")
  String? grade;



  @JsonKey(name:"board")
  Board? board;

  Grade();


  static const fromJsonFactory=_$GradeFromJson;
  factory Grade.fromJson(Map<String,dynamic> json)=>_$GradeFromJson(json);
  Map<String,dynamic>toJson()=>_$GradeToJson(this);


}

