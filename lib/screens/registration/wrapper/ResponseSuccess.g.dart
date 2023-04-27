// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseSuccess.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSuccess _$ResponseSuccessFromJson(Map<String, dynamic> json) =>
    ResponseSuccess()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseSuccessToJson(ResponseSuccess instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
