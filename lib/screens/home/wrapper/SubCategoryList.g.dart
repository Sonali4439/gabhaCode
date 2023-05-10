// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubCategoryList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryList _$SubCategoryListFromJson(Map<String, dynamic> json) =>
    SubCategoryList()
      ..id = json['_id'] as String?
      ..categoryName = json['name'] as String?
      ..languageName = json['language_name'] as String?
      ..position = json['position'] as int?
      ..categoryList = json['category'] == null
          ? null
          : CategoryList.fromJson(json['category'] as Map<String, dynamic>)
      ..layout = json['layout'] == null
          ? null
          : Layout.fromJson(json['layout'] as Map<String, dynamic>);

Map<String, dynamic> _$SubCategoryListToJson(SubCategoryList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.categoryName,
      'language_name': instance.languageName,
      'position': instance.position,
      'category': instance.categoryList,
      'layout': instance.layout,
    };
