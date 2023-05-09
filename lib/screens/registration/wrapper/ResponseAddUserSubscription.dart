
import 'package:gabha_app1/screens/registration/wrapper/PayloadAddUserSubscription.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseAddUserSubscription.g.dart';

@JsonSerializable()
class ResponseAddUserSubscription {
  ServerStatus? status;
  PayloadAddUserSubscription? payload;

  PayloadAddUserSubscription? getPayload() {
    return payload;
  }

  ResponseAddUserSubscription();
  static const fromJsonFactory=_$ResponseAddUserSubscriptionFromJson;
  factory ResponseAddUserSubscription.fromJson(Map<String,dynamic> json)=>_$ResponseAddUserSubscriptionFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseAddUserSubscriptionToJson(this);

}
