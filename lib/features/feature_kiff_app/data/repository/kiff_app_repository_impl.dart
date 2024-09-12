import 'package:dio/dio.dart';
import 'package:kiff_app_test/core/base/data_state.dart';
import 'package:kiff_app_test/core/utils/extension.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/data_source/remote/api_provider.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/item_data.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/list_data.dart';
import 'package:kiff_app_test/features/feature_kiff_app/domain/repository/kiff_app_repository.dart';

class KiffAppRepositoryImpl extends KiffAppRepository {
  ApiProvider apiProvider;

  KiffAppRepositoryImpl(this.apiProvider);

  @override
  Future<DataStatus<List<ItemData>>> getListData() async {
    try {
      Response response = await apiProvider.getList();
      ListData listData = ListData.fromJson(response.data);
      return DataSuccess(listData.data);
    } on DioException catch (error) {
      return DataFailed(error.handle());
    }
  }
}
