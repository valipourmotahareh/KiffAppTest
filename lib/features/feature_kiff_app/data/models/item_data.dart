import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_data.g.dart';

@JsonSerializable(createToJson: true)
class ItemData extends Equatable {
  final String? text;

  const ItemData({
    this.text,
  });

  factory ItemData.fromJson(Map<String, Object?> json) =>
      _$ItemDataFromJson(json);

  ItemData copyWith({
    String? text,
  }) =>
      ItemData(
        text: text ?? this.text,
      );

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);

  @override
// TODO: implement props
  List<Object?> get props => [
        text,
      ];
}
