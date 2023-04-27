

import 'package:json_annotation/json_annotation.dart';

import 'ServerStatus.dart';

part 'ResponseGetAllGradeByBoard.g.dart';

@JsonSerializable()
class ResponseGetAllGradeByBoard {
  ServerStatus? status;

  List<String>? payload;

  List<String>? getPayload() {
    return payload;
  }

  ResponseGetAllGradeByBoard();
  static const fromJsonFactory=_$ResponseGetAllGradeByBoardFromJson;
  factory ResponseGetAllGradeByBoard.fromJson(Map<String,dynamic> json)=>_$ResponseGetAllGradeByBoardFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseGetAllGradeByBoardToJson(this);

}
