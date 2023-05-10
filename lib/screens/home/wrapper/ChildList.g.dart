// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChildList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildList _$ChildListFromJson(Map<String, dynamic> json) => ChildList()
  ..child = json['child'] == null
      ? null
      : Child.fromJson(json['child'] as Map<String, dynamic>)
  ..grade = json['grade'] == null
      ? null
      : Grade.fromJson(json['grade'] as Map<String, dynamic>);

Map<String, dynamic> _$ChildListToJson(ChildList instance) => <String, dynamic>{
      'child': instance.child,
      'grade': instance.grade,
    };
