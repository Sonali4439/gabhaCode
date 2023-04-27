// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetAllGradeByBoard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetAllGradeByBoard _$ResponseGetAllGradeByBoardFromJson(
        Map<String, dynamic> json) =>
    ResponseGetAllGradeByBoard()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload =
          (json['payload'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ResponseGetAllGradeByBoardToJson(
        ResponseGetAllGradeByBoard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
