part of 'kiff_app_bloc.dart';

class KiffAppState extends Equatable {
  final KiffAppStatus kiffAppStatus;

  const KiffAppState({
    required this.kiffAppStatus,
  });

  KiffAppState copyWith({
    KiffAppStatus? newKiffAppStatus,
  }) {
    return KiffAppState(
      kiffAppStatus: newKiffAppStatus ?? kiffAppStatus,
    );
  }

  @override
  List<Object?> get props => [kiffAppStatus];
}
