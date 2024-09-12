import 'package:kiff_app_test/core/base/data_state.dart';
import 'package:kiff_app_test/core/base/use_case.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/item_data.dart';
import 'package:kiff_app_test/features/feature_kiff_app/domain/repository/kiff_app_repository.dart';

class GetListUseCase  implements UseCase<DataStatus<List<ItemData>>, NoParams>{
  final KiffAppRepository kiffAppRepository;

  GetListUseCase(this.kiffAppRepository);

  @override
  Future<DataStatus<List<ItemData>>> call({NoParams? param}) {
    return kiffAppRepository.getListData();
  }
}