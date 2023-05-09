
import 'package:gabha_app1/screens/registration/wrapper/Grade.dart';
import 'package:gabha_app1/screens/registration/wrapper/ServerStatus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetStandard.g.dart';

@JsonSerializable()
class ResponseGetStandard {
  ServerStatus? status;
  List<Grade>? payload;

  List<Grade>? getPayload() {
    return payload;
  }

  ResponseGetStandard();
  static const fromJsonFactory=_$ResponseGetStandardFromJson;
  factory ResponseGetStandard.fromJson(Map<String,dynamic> json)=>_$ResponseGetStandardFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseGetStandardToJson(this);

}
