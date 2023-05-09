// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayloadGetUserChild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadGetUserChild _$PayloadGetUserChildFromJson(Map<String, dynamic> json) =>
    PayloadGetUserChild()
      ..id = json['_id'] as String?
      ..childList = (json['child_list'] as List<dynamic>?)
          ?.map((e) => ChildList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PayloadGetUserChildToJson(
        PayloadGetUserChild instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'child_list': instance.childList,
    };
