// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestUserUpdate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUserUpdate _$RequestUserUpdateFromJson(Map<String, dynamic> json) =>
    RequestUserUpdate()
      ..userId = json['user_id'] as String?
      ..userName = json['name'] as String?
      ..mobileNo = json['mobile'] as String?
      ..email = json['email'] as String?
      ..modeOfCommunication = json['mode_of_communication'] as String?;

Map<String, dynamic> _$RequestUserUpdateToJson(RequestUserUpdate instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.userName,
      'mobile': instance.mobileNo,
      'email': instance.email,
      'mode_of_communication': instance.modeOfCommunication,
    };
