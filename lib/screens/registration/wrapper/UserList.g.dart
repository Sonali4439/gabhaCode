// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) => UserList()
  ..id = json['_id'] as String?
  ..useName = json['name'] as String?
  ..isParent = json['is_parent'] as bool?
  ..mobileNumber = json['mobile_no'] as String?
  ..emailID = json['email'] as String?
  ..modeOfCommunication = json['mode_of_communication'] as String?
  ..grade = json['grade'] == null
      ? null
      : Grade.fromJson(json['grade'] as Map<String, dynamic>);

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.useName,
      'is_parent': instance.isParent,
      'mobile_no': instance.mobileNumber,
      'email': instance.emailID,
      'mode_of_communication': instance.modeOfCommunication,
      'grade': instance.grade,
    };
