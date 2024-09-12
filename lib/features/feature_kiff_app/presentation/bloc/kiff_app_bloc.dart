import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiff_app_test/core/base/data_state.dart';
import 'package:kiff_app_test/features/feature_kiff_app/domain/use_case/get_list_use_case.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/bloc/kiff_app_status.dart';

part 'kiff_app_event.dart';

part 'kiff_app_state.dart';

class KiffAppBloc extends Bloc<KiffAppEvent, KiffAppState> {
  final GetListUseCase getListUseCase;

  KiffAppBloc(this.getListUseCase)
      : super(KiffAppState(kiffAppStatus: KiffAppLoading())) {

    on<GetListItemEvent>((event, emit) async {
      emit(state.copyWith(newKiffAppStatus: KiffAppLoading()));
      DataStatus dataStatus = await getListUseCase();
      if (dataStatus is DataSuccess) {
        emit(state.copyWith(
            newKiffAppStatus: KiffAppCompleted(dataStatus.data)));
      }
      if (dataStatus is DataFailed) {
        emit(state.copyWith(newKiffAppStatus: KiffAppError(dataStatus.error!)));
      }
    });

    add(GetListItemEvent());
  }
}
