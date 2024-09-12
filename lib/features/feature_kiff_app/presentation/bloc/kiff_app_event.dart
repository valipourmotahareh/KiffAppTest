part of 'kiff_app_bloc.dart';

abstract class TransferEvent {}

class KiffAppEvent extends TransferEvent {
  KiffAppEvent();
}

class GetListItemEvent extends KiffAppEvent {
  GetListItemEvent();
}
