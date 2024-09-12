import 'package:dio/dio.dart';
import 'package:kiff_app_test/config/constant/remote_routes.dart';
import 'package:kiff_app_test/core/dependency_injection/locator.dart';

class ApiProvider{
  ApiProvider();

  /// get api from server
  Future<Response<dynamic>> getList() {
    return locator.get<Dio>().get<dynamic>(
      RemoteRoutes.getLists,);
  }
}