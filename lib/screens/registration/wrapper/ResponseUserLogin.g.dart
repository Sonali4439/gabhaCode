// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseUserLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserLogin _$ResponseUserLoginFromJson(Map<String, dynamic> json) =>
    ResponseUserLogin()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadUserLogin.fromJson(json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseUserLoginToJson(ResponseUserLogin instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
