// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AcademicYear.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicYear _$AcademicYearFromJson(Map<String, dynamic> json) => AcademicYear()
  ..id = json['_id'] as String?
  ..grade = json['grade'] == null
      ? null
      : Grade.fromJson(json['grade'] as Map<String, dynamic>)
  ..startAcademicDate = json['start_date'] as String?
  ..endAcademicDate = json['end_date'] as String?
  ..message = json['message'] as String?;

Map<String, dynamic> _$AcademicYearToJson(AcademicYear instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'grade': instance.grade,
      'start_date': instance.startAcademicDate,
      'end_date': instance.endAcademicDate,
      'message': instance.message,
    };
