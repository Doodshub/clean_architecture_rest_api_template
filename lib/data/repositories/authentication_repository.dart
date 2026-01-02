import 'package:clean_architecture_template/common/architecture/base_repository.dart';
import 'package:clean_architecture_template/common/models/session_token/session_token.dart';
import 'package:clean_architecture_template/common/models/user/user.dart';
import 'package:dio/dio.dart';

/// Authentication repository for user login, registration, and profile retrieval.
///
/// API endpoints should be configured in your consuming app by overriding these methods
/// or by passing endpoint parameters when calling these methods.
///
/// Example:
/// ```dart
/// class AppAuthenticationRepository extends AuthenticationRepository {
///   AppAuthenticationRepository({required super.dio});
///
///   @override
///   String get loginEndpoint => '/auth/login';
///
///   @override
///   String get registerEndpoint => '/auth/register';
///
///   @override
///   String get getMeEndpoint => '/auth/me';
/// }
/// ```
class AuthenticationRepository extends BaseRepository {
  AuthenticationRepository({required Dio dio}) : super(dio);

  /// Override this in your app to specify the login endpoint
  String get loginEndpoint => '/auth/login';

  /// Override this in your app to specify the register endpoint
  String get registerEndpoint => '/auth/register';

  /// Override this in your app to specify the get user profile endpoint
  String get getMeEndpoint => '/auth/me';

  Future<SessionToken?> login({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> credential = {
      'username': email,
      'password': password,
    };

    try {
      final response = await dio.post(loginEndpoint, data: credential);

      final data = response.data['data'];

      final sessionToken = SessionToken.fromJson(data);

      return sessionToken;
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
    }
  }

  Future<BaseUser?> getMe() async {
    try {
      final response = await dio.get(getMeEndpoint);

      final data = response.data;

      final user = BaseUser.fromJson(data);

      return user;
    } on DioException catch (e) {
      throw Exception('Get user failed: ${e.message}');
    }
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };

    try {
      await dio.post(registerEndpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }
}
