abstract class BaseDatabaseConstants<T> {
  String get name;
}

class UserDatabase extends BaseDatabaseConstants {
  @override
  String get name => 'user';

  List<Map<String, dynamic>>? valuesToMap(dynamic values) {
    return values.map((e) {
      return e.toJson();
    }).toList();
  }
}
