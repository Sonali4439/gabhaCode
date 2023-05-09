// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseRegistration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseRegistration _$ResponseRegistrationFromJson(
        Map<String, dynamic> json) =>
    ResponseRegistration()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadRegistration.fromJson(
              json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseRegistrationToJson(
        ResponseRegistration instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
