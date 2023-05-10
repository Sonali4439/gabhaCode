
import 'package:json_annotation/json_annotation.dart';

part 'PayloadGetCategoryUniqueSections.g.dart';


@JsonSerializable()
class PayloadGetCategoryUniqueSections {
  @JsonKey(name:"_id")
  String? id;




  PayloadGetCategoryUniqueSections();


  static const fromJsonFactory=_$PayloadGetCategoryUniqueSectionsFromJson;
  factory PayloadGetCategoryUniqueSections.fromJson(Map<String,dynamic> json)=>_$PayloadGetCategoryUniqueSectionsFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadGetCategoryUniqueSectionsToJson(this);

}
