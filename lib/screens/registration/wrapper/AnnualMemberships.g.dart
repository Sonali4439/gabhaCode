// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnnualMemberships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualMemberships _$AnnualMembershipsFromJson(Map<String, dynamic> json) =>
    AnnualMemberships()
      ..id = json['_id'] as String?
      ..academicYear = json['academic_year'] == null
          ? null
          : AcademicYear.fromJson(json['academic_year'] as Map<String, dynamic>)
      ..subscriptionType = json['subscription_type'] == null
          ? null
          : SubscriptionType.fromJson(
              json['subscription_type'] as Map<String, dynamic>)
      ..subscriptionDays = json['days'] as int?
      ..subscriptionPrice = json['price'] as int?
      ..discountPrice = json['discount_price'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AnnualMembershipsToJson(AnnualMemberships instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'academic_year': instance.academicYear,
      'subscription_type': instance.subscriptionType,
      'days': instance.subscriptionDays,
      'price': instance.subscriptionPrice,
      'discount_price': instance.discountPrice,
      'message': instance.message,
    };
