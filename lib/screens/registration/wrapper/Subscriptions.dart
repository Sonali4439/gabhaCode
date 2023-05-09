
import 'package:gabha_app1/screens/registration/wrapper/AcademicYear.dart';
import 'package:gabha_app1/screens/registration/wrapper/SubscriptionType.dart';
import 'package:json_annotation/json_annotation.dart';


part 'Subscriptions.g.dart';


@JsonSerializable()
class Subscriptions {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"subscription_type")
  SubscriptionType? subscriptionType;

  @JsonKey(name:"academic_year")
  AcademicYear? academicYear;


  Subscriptions();

  static const fromJsonFactory=_$SubscriptionsFromJson;
  factory Subscriptions.fromJson(Map<String,dynamic> json)=>_$SubscriptionsFromJson(json);
  Map<String,dynamic>toJson()=>_$SubscriptionsToJson(this);


}