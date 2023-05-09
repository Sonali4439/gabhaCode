// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadLogin _$PayloadLoginFromJson(Map<String, dynamic> json) => PayloadLogin()
  ..token = json['token'] as String?
  ..userList = json['user'] == null
      ? null
      : UserList.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$PayloadLoginToJson(PayloadLogin instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.userList,
    };
