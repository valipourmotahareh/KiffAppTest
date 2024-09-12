import 'package:kiff_app_test/core/base/data_state.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/item_data.dart';

abstract class KiffAppRepository{
  Future<DataStatus<List<ItemData>>> getListData();

}