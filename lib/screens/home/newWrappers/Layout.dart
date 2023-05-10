

import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:json_annotation/json_annotation.dart';


part 'Layout.g.dart';

@JsonSerializable()
class Layout {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"layout")
  String? layout;

  @JsonKey(name:"layout_filepath")
  String? layoutFilepath;


  Layout();


  static const fromJsonFactory=_$LayoutFromJson;
  factory Layout.fromJson(Map<String,dynamic> json)=>_$LayoutFromJson(json);
  Map<String,dynamic>toJson()=>_$LayoutToJson(this);


}

