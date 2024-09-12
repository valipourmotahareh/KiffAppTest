// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListData _$ListDataFromJson(Map<String, dynamic> json) => ListData(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
