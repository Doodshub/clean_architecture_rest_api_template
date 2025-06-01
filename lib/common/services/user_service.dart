import 'package:clean_architecture_rest_api_template/common/models/user/user.dart';
import 'package:clean_architecture_rest_api_template/data/database/database_service.dart';
import 'package:clean_architecture_rest_api_template/data/database/databases.dart';
import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';

class UserService {
  UserService(this.database);
  final DatabaseService database;

  Stream<User?> listenToUser() {
    final databaseService = sl<DatabaseService>();
    return databaseService.multipleListen(UserDatabase().name).map((users) {
      if (users.isEmpty) {
        return null;
      }
      return User.fromJson(users.first);
    });
  }

  Future<User?> getUser() async {
    final databaseService = sl<DatabaseService>();
    final users = await databaseService.getAll(UserDatabase().name);
    if (users?.isEmpty ?? true) {
      return null;
    }
    return User.fromJson(users!.first);
  }
}
