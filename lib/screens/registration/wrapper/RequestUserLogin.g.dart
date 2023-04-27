// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestUserLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUserLogin _$RequestUserLoginFromJson(Map<String, dynamic> json) =>
    RequestUserLogin()
      ..mobileNo = json['mobile_no'] as String?
      ..otp = json['otp'] as String?;

Map<String, dynamic> _$RequestUserLoginToJson(RequestUserLogin instance) =>
    <String, dynamic>{
      'mobile_no': instance.mobileNo,
      'otp': instance.otp,
    };
