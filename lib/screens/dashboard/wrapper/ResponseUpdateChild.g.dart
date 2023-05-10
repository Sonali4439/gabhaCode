// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseUpdateChild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUpdateChild _$ResponseUpdateChildFromJson(Map<String, dynamic> json) =>
    ResponseUpdateChild()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadUpdateChild.fromJson(
              json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseUpdateChildToJson(
        ResponseUpdateChild instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
