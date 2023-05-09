// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadRegistration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadRegistration _$PayloadRegistrationFromJson(Map<String, dynamic> json) =>
    PayloadRegistration()
      ..token = json['token'] as String?
      ..userId = json['_id'] as String?
      ..userName = json['name'] as String?
      ..isParent = json['is_parent'] as bool?
      ..mobileNumber = json['mobile_no'] as String?
      ..email = json['email'] as String?
      ..modeOfCommunication = json['mode_of_communication'] as String?;

Map<String, dynamic> _$PayloadRegistrationToJson(
        PayloadRegistration instance) =>
    <String, dynamic>{
      'token': instance.token,
      '_id': instance.userId,
      'name': instance.userName,
      'is_parent': instance.isParent,
      'mobile_no': instance.mobileNumber,
      'email': instance.email,
      'mode_of_communication': instance.modeOfCommunication,
    };
