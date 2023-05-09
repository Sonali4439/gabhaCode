
import 'package:json_annotation/json_annotation.dart';


part 'TranslateLanguageList.g.dart';


@JsonSerializable()
class TranslateLanguageList {

  @JsonKey(name:"_id")
  String? id;
  @JsonKey(name:"name")
  String? translateLanguageName;




  TranslateLanguageList();


  static const fromJsonFactory=_$TranslateLanguageListFromJson;
  factory TranslateLanguageList.fromJson(Map<String,dynamic> json)=>_$TranslateLanguageListFromJson(json);
  Map<String,dynamic>toJson()=>_$TranslateLanguageListToJson(this);


}

