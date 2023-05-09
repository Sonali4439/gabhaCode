// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetSubCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetSubCategory _$ResponseGetSubCategoryFromJson(
        Map<String, dynamic> json) =>
    ResponseGetSubCategory()
      ..status = json['status'] == null
          ? null
          : ServerStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..payload = (json['payload'] as List<dynamic>?)
          ?.map((e) => SubCategoryList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ResponseGetSubCategoryToJson(
        ResponseGetSubCategory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payload': instance.payload,
    };
