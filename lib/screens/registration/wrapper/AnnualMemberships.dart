

import 'package:gabha_app1/screens/registration/wrapper/AcademicYear.dart';
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/SubscriptionType.dart';
import 'package:json_annotation/json_annotation.dart';


part 'AnnualMemberships.g.dart';


@JsonSerializable()
class AnnualMemberships {
  @JsonKey(name:"_id")
  String? id;

  @JsonKey(name:"academic_year")
  AcademicYear? academicYear;

  @JsonKey(name:"subscription_type")
  SubscriptionType? subscriptionType;

  @JsonKey(name:"days")
  int? subscriptionDays;

  @JsonKey(name:"price")
  int? subscriptionPrice;

  @JsonKey(name:"discount_price")
  int? discountPrice;


  //message field for fail
  @JsonKey(name:"message")
  String? message;


  AnnualMemberships();


  static const fromJsonFactory=_$AnnualMembershipsFromJson;
  factory AnnualMemberships.fromJson(Map<String,dynamic> json)=>_$AnnualMembershipsFromJson(json);
  Map<String,dynamic>toJson()=>_$AnnualMembershipsToJson(this);


}

