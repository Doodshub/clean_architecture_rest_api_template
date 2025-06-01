import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';
import 'package:clean_architecture_rest_api_template/models/app_environment.dart';
import 'package:clean_architecture_rest_api_template/services/token_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
    });

    if (!(sl<AppEnvironment>().isTestEnvironment ?? false)) {}

    var token = await sl.get<TokenService>().getToken();

    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
