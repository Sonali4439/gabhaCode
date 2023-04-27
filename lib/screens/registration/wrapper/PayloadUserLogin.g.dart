// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadUserLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadUserLogin _$PayloadUserLoginFromJson(Map<String, dynamic> json) =>
    PayloadUserLogin()
      ..token = json['token'] as String?
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$PayloadUserLoginToJson(PayloadUserLogin instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
