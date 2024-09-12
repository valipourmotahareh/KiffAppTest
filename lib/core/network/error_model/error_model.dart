import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  int? statusCode;
  DateTime? timestamp;
  String? title;
  String? message;


  ErrorModel({this.statusCode, this.timestamp, this.message,this.title});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
