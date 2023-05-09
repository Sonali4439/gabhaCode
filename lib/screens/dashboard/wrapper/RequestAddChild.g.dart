// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestAddChild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddChild _$RequestAddChildFromJson(Map<String, dynamic> json) =>
    RequestAddChild()
      ..userId = json['user_id'] as String?
      ..childName = json['child_name'] as String?
      ..gradeId = json['grade_id'] as String?;

Map<String, dynamic> _$RequestAddChildToJson(RequestAddChild instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'child_name': instance.childName,
      'grade_id': instance.gradeId,
    };
