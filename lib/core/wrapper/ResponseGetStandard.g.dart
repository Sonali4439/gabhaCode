// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetStandard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetStandard _$ResponseGetStandardFromJson(Map<String, dynamic> json) =>
    ResponseGetStandard()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = (json['payload'] as List<dynamic>?)
          ?.map((e) => Grade.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ResponseGetStandardToJson(
        ResponseGetStandard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
