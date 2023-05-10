
import 'package:json_annotation/json_annotation.dart';

part 'Board.g.dart';


@JsonSerializable()
class Board {

  @JsonKey(name:"_id")
  String? id;
  @JsonKey(name:"board")
  String? board;
  @JsonKey(name:"short_name")
  String? boardShortName;
  @JsonKey(name:"logo_filepath")
  String? logoFilepath;

  Board();




  static const fromJsonFactory=_$BoardFromJson;
  factory Board.fromJson(Map<String,dynamic> json)=>_$BoardFromJson(json);
  Map<String,dynamic>toJson()=>_$BoardToJson(this);


}

