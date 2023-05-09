// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) => CategoryList()
  ..id = json['_id'] as String?
  ..categoryName = json['name'] as String?
  ..languageName = json['language_name'] as String?
  ..position = json['position'] as int?
  ..section = json['section'] as int?
  ..imageFilepath = json['image_filepath'] as String?
  ..grade = json['grade'] == null
      ? null
      : Grade.fromJson(json['grade'] as Map<String, dynamic>)
  ..message = json['message'] as String?;

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.categoryName,
      'language_name': instance.languageName,
      'position': instance.position,
      'section': instance.section,
      'image_filepath': instance.imageFilepath,
      'grade': instance.grade,
      'message': instance.message,
    };
