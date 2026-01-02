import 'package:clean_architecture_template/common/models/user/user.dart';
import 'package:clean_architecture_template/data/database/database_service.dart';
import 'package:clean_architecture_template/data/database/databases.dart';
import 'package:clean_architecture_template/dependencies/dependency_manager.dart';

class UserService {
  UserService(this.database);
  final DatabaseService database;

  Stream<BaseUser?> listenToUser() {
    final databaseService = sl<DatabaseService>();
    return databaseService.multipleListen(UserDatabase().name).map((users) {
      if (users.isEmpty) {
        return null;
      }
      return BaseUser.fromJson(users.first);
    });
  }

  Future<BaseUser?> getUser() async {
    final databaseService = sl<DatabaseService>();
    final users = await databaseService.getAll(UserDatabase().name);
    if (users?.isEmpty ?? true) {
      return null;
    }
    return BaseUser.fromJson(users!.first);
  }
}
