// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade()
  ..id = json['_id'] as String?
  ..grade = json['grade'] as String?
  ..board = json['board'] == null
      ? null
      : Board.fromJson(json['board'] as Map<String, dynamic>);

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      '_id': instance.id,
      'grade': instance.grade,
      'board': instance.board,
    };
