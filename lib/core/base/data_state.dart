import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DataStatus<T> extends Equatable {
  final T? data;
  final dynamic error;
  const DataStatus(this.data, this.error);
}

class DataSuccess<T> extends DataStatus<T> {
  const DataSuccess(T? data) : super(data, null);

  @override
  List<Object?> get props => [data];
}

class DataFailed<T> extends DataStatus<T> {
  const DataFailed(dynamic error) : super(null, error);

  @override
  List<Object?> get props => [error];
}
