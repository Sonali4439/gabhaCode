// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseAnnualMembership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAnnualMembership _$ResponseAnnualMembershipFromJson(
        Map<String, dynamic> json) =>
    ResponseAnnualMembership()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = (json['payload'] as List<dynamic>?)
          ?.map((e) => AnnualMemberships.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ResponseAnnualMembershipToJson(
        ResponseAnnualMembership instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
