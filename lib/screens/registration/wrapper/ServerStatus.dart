import 'package:json_annotation/json_annotation.dart';

part 'ServerStatus.g.dart';

@JsonSerializable()
class ServerStatus {
  String? message;
  @JsonKey(name:"status_code")
  int? statusCode;

  ServerStatus();
  static const fromJsonFactory=_$ServerStatusFromJson;
  factory ServerStatus.fromJson(Map<String,dynamic> json)=>_$ServerStatusFromJson(json);
  Map<String,dynamic>toJson()=>_$ServerStatusToJson(this);

}