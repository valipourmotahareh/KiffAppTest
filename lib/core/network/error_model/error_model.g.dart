// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map json) => ErrorModel(
      statusCode: json['statusCode'] as int?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      message: json['message'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp?.toIso8601String(),
      'title': instance.title,
      'message': instance.message,
    };
