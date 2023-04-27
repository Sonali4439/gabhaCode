import 'package:json_annotation/json_annotation.dart';

import 'ServerStatus.dart';

part 'ResponseSuccess.g.dart';

@JsonSerializable()
class ResponseSuccess {
  ServerStatus? status;

  ResponseSuccess();
  static const fromJsonFactory=_$ResponseSuccessFromJson;
  factory ResponseSuccess.fromJson(Map<String,dynamic> json)=>_$ResponseSuccessFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseSuccessToJson(this);

}