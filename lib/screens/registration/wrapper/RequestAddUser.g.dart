// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestAddUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddUser _$RequestAddUserFromJson(Map<String, dynamic> json) =>
    RequestAddUser()
      ..name = json['name'] as String?
      ..isParent = json['is_parent'] as bool?
      ..mobileNo = json['mobile_no'] as String?
      ..email = json['email'] as String?
      ..modeOfCommunication = json['mode_of_communication'] as String?
      ..childName = json['child_name'] as String?
      ..childGradeId = json['child_grade_id'] as String?
      ..gradeId = json['grade_id'] as String?;

Map<String, dynamic> _$RequestAddUserToJson(RequestAddUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_parent': instance.isParent,
      'mobile_no': instance.mobileNo,
      'email': instance.email,
      'mode_of_communication': instance.modeOfCommunication,
      'child_name': instance.childName,
      'child_grade_id': instance.childGradeId,
      'grade_id': instance.gradeId,
    };
