// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subscriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscriptions _$SubscriptionsFromJson(Map<String, dynamic> json) =>
    Subscriptions()
      ..id = json['_id'] as String?
      ..subscriptionType = json['subscription_type'] == null
          ? null
          : SubscriptionType.fromJson(
              json['subscription_type'] as Map<String, dynamic>)
      ..academicYear = json['academic_year'] == null
          ? null
          : AcademicYear.fromJson(
              json['academic_year'] as Map<String, dynamic>);

Map<String, dynamic> _$SubscriptionsToJson(Subscriptions instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'subscription_type': instance.subscriptionType,
      'academic_year': instance.academicYear,
    };
