


import 'package:json_annotation/json_annotation.dart';

import 'Board.dart';
import 'ServerStatus.dart';

part 'ResponseGetAllBoard.g.dart';

@JsonSerializable()
class ResponseGetAllBoard {
  ServerStatus? status;
  List<Board>? payload;

  List<Board>? getPayload() {
    return payload;
  }

  ResponseGetAllBoard();
  static const fromJsonFactory=_$ResponseGetAllBoardFromJson;
  factory ResponseGetAllBoard.fromJson(Map<String,dynamic> json)=>_$ResponseGetAllBoardFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseGetAllBoardToJson(this);

}
