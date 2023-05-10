// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestEditChildProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestEditChildProfile _$RequestEditChildProfileFromJson(
        Map<String, dynamic> json) =>
    RequestEditChildProfile()
      ..userId = json['user_id'] as String?
      ..userName = json['name'] as String?
      ..mobileNo = json['mobile'] as String?
      ..email = json['email'] as String?
      ..gradeId = json['grade_id'] as String?;

Map<String, dynamic> _$RequestEditChildProfileToJson(
        RequestEditChildProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.userName,
      'mobile': instance.mobileNo,
      'email': instance.email,
      'grade_id': instance.gradeId,
    };
