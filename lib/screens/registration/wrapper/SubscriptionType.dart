

import 'package:json_annotation/json_annotation.dart';


part 'SubscriptionType.g.dart';


@JsonSerializable()
class SubscriptionType {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"type")
  String? type;


  //message field for fail
  @JsonKey(name:"message")
  String? message;


  SubscriptionType();


  static const fromJsonFactory=_$SubscriptionTypeFromJson;
  factory SubscriptionType.fromJson(Map<String,dynamic> json)=>_$SubscriptionTypeFromJson(json);
  Map<String,dynamic>toJson()=>_$SubscriptionTypeToJson(this);


}

