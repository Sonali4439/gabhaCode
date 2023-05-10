
import 'package:gabha_app1/screens/home/wrapper/ChildList.dart';
import 'package:gabha_app1/screens/registration/wrapper/Subscriptions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadGetUserChild.g.dart';


@JsonSerializable()
class PayloadGetUserChild {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"child_list")
  List<ChildList>? childList;


  PayloadGetUserChild();


  static const fromJsonFactory=_$PayloadGetUserChildFromJson;
  factory PayloadGetUserChild.fromJson(Map<String,dynamic> json)=>_$PayloadGetUserChildFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadGetUserChildToJson(this);

}
