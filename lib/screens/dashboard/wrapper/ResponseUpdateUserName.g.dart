// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseUpdateUserName.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUpdateUserName _$ResponseUpdateUserNameFromJson(
        Map<String, dynamic> json) =>
    ResponseUpdateUserName()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadUpdateUserName.fromJson(
              json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseUpdateUserNameToJson(
        ResponseUpdateUserName instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
