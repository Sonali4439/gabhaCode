// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseSection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSection _$ResponseSectionFromJson(Map<String, dynamic> json) =>
    ResponseSection()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = (json['payload'] as List<dynamic>?)
          ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ResponseSectionToJson(ResponseSection instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
