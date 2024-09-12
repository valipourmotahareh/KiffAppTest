import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiff_app_test/core/network/error_model/error_model.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/item_data.dart';

@immutable
abstract class KiffAppStatus extends Equatable {}

class KiffAppLoading extends KiffAppStatus {
  @override
  List<Object?> get props => [];
}

class KiffAppCompleted extends KiffAppStatus {
  final List<ItemData> itemData;

  KiffAppCompleted(this.itemData);

  @override
  List<Object?> get props => [itemData];
}

class KiffAppError extends KiffAppStatus {
  final ErrorModel errorModel;

  KiffAppError(this.errorModel);

  @override
  List<Object?> get props => [errorModel];
}
