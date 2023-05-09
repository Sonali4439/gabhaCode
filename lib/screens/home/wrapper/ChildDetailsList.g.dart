// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChildDetailsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildDetailsList _$ChildDetailsListFromJson(Map<String, dynamic> json) =>
    ChildDetailsList()
      ..child = json['child'] == null
          ? null
          : Child.fromJson(json['child'] as Map<String, dynamic>)
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChildDetailsListToJson(ChildDetailsList instance) =>
    <String, dynamic>{
      'child': instance.child,
      'message': instance.message,
    };
