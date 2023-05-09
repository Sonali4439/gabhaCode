
import 'package:gabha_app1/screens/home/wrapper/TranslateLanguageList.dart';
import 'package:json_annotation/json_annotation.dart';


part 'SubjectList.g.dart';


@JsonSerializable()
class SubjectList {

  @JsonKey(name:"_id")
  String? id;
  @JsonKey(name:"name")
  String? subjectName;

  @JsonKey(name:"translate_language_list")
  List<TranslateLanguageList>? traslateLanguageList;


  SubjectList();


  static const fromJsonFactory=_$SubjectListFromJson;
  factory SubjectList.fromJson(Map<String,dynamic> json)=>_$SubjectListFromJson(json);
  Map<String,dynamic>toJson()=>_$SubjectListToJson(this);


}

