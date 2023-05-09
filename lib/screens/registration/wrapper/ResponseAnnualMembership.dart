

import 'package:gabha_app1/screens/registration/wrapper/AnnualMemberships.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ResponseAnnualMembership.g.dart';

@JsonSerializable()
class ResponseAnnualMembership {
  ServerStatus? status;
  List<AnnualMemberships>? payload;

  List<AnnualMemberships>? getPayload() {
    return payload;
  }

  ResponseAnnualMembership();
  static const fromJsonFactory=_$ResponseAnnualMembershipFromJson;
  factory ResponseAnnualMembership.fromJson(Map<String,dynamic> json)=>_$ResponseAnnualMembershipFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseAnnualMembershipToJson(this);

}
