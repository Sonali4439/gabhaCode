// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SectionCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionCategory _$SectionCategoryFromJson(Map<String, dynamic> json) =>
    SectionCategory()
      ..id = json['_id'] as String?
      ..name = json['name'] as String?
      ..categoryList = (json['category_list'] as List<dynamic>?)
          ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..message = json['message'] as String?;

Map<String, dynamic> _$SectionCategoryToJson(SectionCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'category_list': instance.categoryList,
      'message': instance.message,
    };
