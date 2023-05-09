// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadAddUserSubscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadAddUserSubscription _$PayloadAddUserSubscriptionFromJson(
        Map<String, dynamic> json) =>
    PayloadAddUserSubscription()
      ..price = json['price'] as int?
      ..discountPrice = json['discount_price'] as int?
      ..userSubscriptionStatus = json['status'] as String?
      ..userSubscriptionId = json['_id'] as String?
      ..subscriptions = json['subscription'] == null
          ? null
          : Subscriptions.fromJson(json['subscription'] as Map<String, dynamic>)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..buySubscriptionDate = json['buy_subscription_date'] as String?
      ..endSubscriptionDate = json['end_subscription_date'] as String?;

Map<String, dynamic> _$PayloadAddUserSubscriptionToJson(
        PayloadAddUserSubscription instance) =>
    <String, dynamic>{
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'status': instance.userSubscriptionStatus,
      '_id': instance.userSubscriptionId,
      'subscription': instance.subscriptions,
      'user': instance.user,
      'buy_subscription_date': instance.buySubscriptionDate,
      'end_subscription_date': instance.endSubscriptionDate,
    };
