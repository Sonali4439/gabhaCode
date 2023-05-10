
import 'package:gabha_app1/screens/home/wrapper/CategoryList.dart';
import 'package:gabha_app1/screens/registration/wrapper/PayloadAddUserSubscription.dart';
import 'package:json_annotation/json_annotation.dart';


part 'SectionCategory.g.dart';


@JsonSerializable()
class SectionCategory {

  @JsonKey(name:"_id")
  String? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"category_list")
  List<CategoryList>? categoryList;





  //message field for fail
  @JsonKey(name:"message")
  String? message;


  SectionCategory();


  static const fromJsonFactory=_$SectionCategoryFromJson;
  factory SectionCategory.fromJson(Map<String,dynamic> json)=>_$SectionCategoryFromJson(json);
  Map<String,dynamic>toJson()=>_$SectionCategoryToJson(this);


}

