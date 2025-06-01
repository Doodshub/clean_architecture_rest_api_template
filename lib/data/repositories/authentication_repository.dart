import 'package:clean_architecture_rest_api_template/common/architecture/base_repository.dart';
import 'package:clean_architecture_rest_api_template/common/models/session_token/session_token.dart';
import 'package:clean_architecture_rest_api_template/common/models/user/user.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository extends BaseRepository {
  AuthenticationRepository({required Dio dio}) : super(dio);

  Future<SessionToken?> login({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> credential = {
      'username': email,
      'password': password,
    };

    try {
      final response = await dio.post('', data: credential);

      final data = response.data['data'];

      final sessionToken = SessionToken.fromJson(data);

      return sessionToken;
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
    }
  }

  Future<User?> getMe() async {
    try {
      final response = await dio.get('');

      final data = response.data;

      final user = User.fromJson(data);

      return user;
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
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
      await dio.post('', data: data);
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
    }
  }
}
