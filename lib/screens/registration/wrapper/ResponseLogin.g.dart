// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) =>
    ResponseLogin()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadLogin.fromJson(json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
