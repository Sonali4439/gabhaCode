// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetAllBoard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetAllBoard _$ResponseGetAllBoardFromJson(Map<String, dynamic> json) =>
    ResponseGetAllBoard()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = (json['payload'] as List<dynamic>?)
          ?.map((e) => Board.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ResponseGetAllBoardToJson(
        ResponseGetAllBoard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
