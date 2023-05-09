

import 'package:json_annotation/json_annotation.dart';

part 'RequestAddSubscription.g.dart';


@JsonSerializable()
class RequestAddSubscription {

  @JsonKey(name:"user_id")
  String? userId;
  @JsonKey(name:"subscription_id")
  String? subscriptionId;
  @JsonKey(name:"price")
  int? price;
  @JsonKey(name:"discount_price")
  int? discountPrice;




  RequestAddSubscription();
  static const fromJsonFactory=_$RequestAddSubscriptionFromJson;
  factory RequestAddSubscription.fromJson(Map<String,dynamic> json)=>_$RequestAddSubscriptionFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestAddSubscriptionToJson(this);

}

