
import 'package:gabha_app1/screens/registration/wrapper/UserList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PayloadRegistration.g.dart';


@JsonSerializable()
class PayloadRegistration {

  @JsonKey(name:"token")
  String? token;

  @JsonKey(name:"_id")
  String? userId;

  @JsonKey(name:"name")
  String? userName;

  @JsonKey(name:"is_parent")
  bool? isParent;

  @JsonKey(name:"mobile_no")
  String? mobileNumber;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"mode_of_communication")
  String? modeOfCommunication;



  PayloadRegistration();


  static const fromJsonFactory=_$PayloadRegistrationFromJson;
  factory PayloadRegistration.fromJson(Map<String,dynamic> json)=>_$PayloadRegistrationFromJson(json);
  Map<String,dynamic>toJson()=>_$PayloadRegistrationToJson(this);

}
