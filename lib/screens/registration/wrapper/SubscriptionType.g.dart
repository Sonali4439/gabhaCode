// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionType _$SubscriptionTypeFromJson(Map<String, dynamic> json) =>
    SubscriptionType()
      ..id = json['_id'] as String?
      ..type = json['type'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SubscriptionTypeToJson(SubscriptionType instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'message': instance.message,
    };
