import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kiff_app_test/config/kiff_router/kiff_router.dart';
import 'package:kiff_app_test/core/network/api_client.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/data_source/remote/api_provider.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/repository/kiff_app_repository_impl.dart';
import 'package:kiff_app_test/features/feature_kiff_app/domain/repository/kiff_app_repository.dart';
import 'package:kiff_app_test/features/feature_kiff_app/domain/use_case/get_list_use_case.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/bloc/kiff_app_bloc.dart';

GetIt locator = GetIt.instance;
setUp(){
  locator
      ..registerSingleton<Dio>(ApiClient().dio)
      ..registerSingleton<GoRouter>(KiffRouter().router);
  /// data sources
  locator.registerSingleton<ApiProvider>(ApiProvider());
  /// repositories
  locator.registerSingleton<KiffAppRepository>(KiffAppRepositoryImpl(locator()));
  /// use cases
  locator.registerSingleton<GetListUseCase>(GetListUseCase(locator()));
  /// blocs
  locator.registerSingleton<KiffAppBloc>(KiffAppBloc(locator()));

}