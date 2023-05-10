
import 'package:gabha_app1/screens/registration/wrapper/AcademicYear.dart';
import 'package:gabha_app1/screens/registration/wrapper/Subscriptions.dart';
import 'package:gabha_app1/screens/registration/wrapper/UserList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadAddUserSubscription.g.dart';


@JsonSerializable()
class PayloadAddUserSubscription {
  @JsonKey(name:"price")
  int? price;

  @JsonKey(name:"discount_price")
  int? discountPrice;

  @JsonKey(name:"status")
  String? userSubscriptionStatus;

  @JsonKey(name:"_id")
  String? userSubscriptionId;

  @JsonKey(name:"subscription")
  Subscriptions? subscriptions;


  @JsonKey(name:"user")
  UserList? user;
  @JsonKey(name:"buy_subscription_date")
  String? buySubscriptionDate;
  @JsonKey(name:"end_subscription_date")
  String? endSubscriptionDate;


  PayloadAddUserSubscription();


  static const fromJsonFactory=_$PayloadAddUserSubscriptionFromJson;
  factory PayloadAddUserSubscription.fromJson(Map<String,dynamic> json)=>_$PayloadAddUserSubscriptionFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadAddUserSubscriptionToJson(this);

}
