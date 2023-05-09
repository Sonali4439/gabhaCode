// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubjectList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectList _$SubjectListFromJson(Map<String, dynamic> json) => SubjectList()
  ..id = json['_id'] as String?
  ..subjectName = json['name'] as String?
  ..traslateLanguageList = (json['translate_language_list'] as List<dynamic>?)
      ?.map((e) => TranslateLanguageList.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SubjectListToJson(SubjectList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.subjectName,
      'translate_language_list': instance.traslateLanguageList,
    };
