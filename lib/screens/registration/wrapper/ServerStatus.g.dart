// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServerStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerStatus _$ServerStatusFromJson(Map<String, dynamic> json) => ServerStatus()
  ..message = json['message'] as String?
  ..statusCode = json['status_code'] as int?;

Map<String, dynamic> _$ServerStatusToJson(ServerStatus instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
    };
