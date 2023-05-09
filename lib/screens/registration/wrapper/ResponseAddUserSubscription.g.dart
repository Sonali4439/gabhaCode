// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseAddUserSubscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAddUserSubscription _$ResponseAddUserSubscriptionFromJson(
        Map<String, dynamic> json) =>
    ResponseAddUserSubscription()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = json['payload'] == null
          ? null
          : PayloadAddUserSubscription.fromJson(
              json['payload'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseAddUserSubscriptionToJson(
        ResponseAddUserSubscription instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
