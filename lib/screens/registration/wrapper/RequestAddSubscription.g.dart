// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestAddSubscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddSubscription _$RequestAddSubscriptionFromJson(
        Map<String, dynamic> json) =>
    RequestAddSubscription()
      ..userId = json['user_id'] as String?
      ..subscriptionId = json['subscription_id'] as String?
      ..price = json['price'] as int?
      ..discountPrice = json['discount_price'] as int?;

Map<String, dynamic> _$RequestAddSubscriptionToJson(
        RequestAddSubscription instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'subscription_id': instance.subscriptionId,
      'price': instance.price,
      'discount_price': instance.discountPrice,
    };
