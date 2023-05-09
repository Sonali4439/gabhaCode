// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child()
  ..childId = json['child_id'] as String?
  ..childName = json['child_name'] as String?
  ..mobileNo = json['mobile_no'] as String?
  ..userSubscription = json['user_subscription'] == null
      ? null
      : PayloadAddUserSubscription.fromJson(
          json['user_subscription'] as Map<String, dynamic>)
  ..message = json['message'] as String?;

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'child_id': instance.childId,
      'child_name': instance.childName,
      'mobile_no': instance.mobileNo,
      'user_subscription': instance.userSubscription,
      'message': instance.message,
    };
