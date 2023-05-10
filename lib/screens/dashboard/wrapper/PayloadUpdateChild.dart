
import 'package:gabha_app1/screens/registration/wrapper/UserList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadUpdateChild.g.dart';


@JsonSerializable()
class PayloadUpdateChild {
  @JsonKey(name:"message")
  String? message;

  PayloadUpdateChild();


  static const fromJsonFactory=_$PayloadUpdateChildFromJson;
  factory PayloadUpdateChild.fromJson(Map<String,dynamic> json)=>_$PayloadUpdateChildFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadUpdateChildToJson(this);

}
