import 'package:dio/dio.dart';
import 'package:kiff_app_test/core/network/error_model/error_model.dart';

extension CustomAssetPaths on String {
  String get png => 'assets/images/$this.png';

  String get webp => 'assets/images/$this.webp';

  String get jpg => 'assets/images/$this.jpeg';

  String get ic => 'assets/icons/$this.svg';

}

extension NetworkUtility on Response? {
  bool validateResponse() {
    return ((this?.statusCode ?? 0) >= 200 && (this?.statusCode ?? 0) < 300);
  }
}

extension DioExceptionHandler on DioException {
  ErrorModel handle() {
    if (response?.statusCode != null) {
      return ErrorModel(
          title: "network.${response?.statusCode ?? 0}.title",
          message: "network.${response?.statusCode ?? 0}.message",
          statusCode: response?.statusCode,
          timestamp: DateTime.now());
    } else {
      String message = switch (type) {
        DioExceptionType.cancel =>
          'The request was manually cancelled by the user',
        DioExceptionType.badCertificate => 'bad Certificate',
        DioExceptionType.badResponse => 'bad Response',
        DioExceptionType.connectionError => 'The connection error',
        DioExceptionType.connectionTimeout =>
          'The request connection took longer than timeout value, it was aborted',
        DioExceptionType.receiveTimeout =>
          'The request took longer than timeout value to receive data, It was aborted',
        DioExceptionType.sendTimeout =>
          'The request took longer than timeout value to send data, It was aborted',
        DioExceptionType.unknown => 'unknown',
      };
      return ErrorModel(
          title: type.name,
          message: message,
          statusCode: 0,
          timestamp: DateTime.now());
    }
  }
}
