// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board()
  ..boardId = json['_id'] as String?
  ..board = json['board'] as String?
  ..boardShortName = json['short_name'] as String?
  ..logoFilepath = json['logo_filepath'] as String?;

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      '_id': instance.boardId,
      'board': instance.board,
      'short_name': instance.boardShortName,
      'logo_filepath': instance.logoFilepath,
    };
