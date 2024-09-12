
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_data.dart';

part 'list_data.g.dart';

@JsonSerializable(createToJson: true)
class ListData extends Equatable{
  final bool? status;
  final List<ItemData>? data;
  const ListData({
      this.status, 
      this.data,}
      );

  factory ListData.fromJson(Map<String, Object?> json) =>
      _$ListDataFromJson(json);


ListData copyWith({  bool? status,
  List<ItemData>? data,
}) => ListData(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson()=> _$ListDataToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>[
    status,
    data
  ];

}