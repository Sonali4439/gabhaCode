// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestUserNameUpdate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUserNameUpdate _$RequestUserNameUpdateFromJson(
        Map<String, dynamic> json) =>
    RequestUserNameUpdate()
      ..userId = json['user_id'] as String?
      ..childName = json['child_name'] as String?;

Map<String, dynamic> _$RequestUserNameUpdateToJson(
        RequestUserNameUpdate instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'child_name': instance.childName,
    };
