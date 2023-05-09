// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade()
  ..grade = json['grade'] as String?
  ..gradeId = json['_id'] as String?
  ..board = json['board'] == null
      ? null
      : Board.fromJson(json['board'] as Map<String, dynamic>);

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'grade': instance.grade,
      '_id': instance.gradeId,
      'board': instance.board,
    };
