// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['_id'] as String?
  ..name = json['name'] as String?
  ..isParent = json['is_parent'] as bool?
  ..mobileNo = json['mobile_no'] as String?
  ..emailId = json['email'] as String?
  ..modeOfCommunication = json['mode_of_communication'] as String?
  ..childList =
      (json['child_list'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'is_parent': instance.isParent,
      'mobile_no': instance.mobileNo,
      'email': instance.emailId,
      'mode_of_communication': instance.modeOfCommunication,
      'child_list': instance.childList,
    };
