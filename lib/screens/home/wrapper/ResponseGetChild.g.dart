// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetChild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetChild _$ResponseGetChildFromJson(Map<String, dynamic> json) =>
    ResponseGetChild()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadGetUserChild.fromJson(
              json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseGetChildToJson(ResponseGetChild instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
