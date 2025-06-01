import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class EnvValues {
  @EnviedField(varName: 'ENV', defaultValue: '', obfuscate: true)
  static String env = _EnvValues.env;

  @EnviedField(varName: 'FLAVOR', defaultValue: '', obfuscate: true)
  static String flavor = _EnvValues.flavor;

  @EnviedField(varName: 'APP_NAME', defaultValue: '', obfuscate: true)
  static String appName = _EnvValues.appName;

  @EnviedField(varName: 'DATABASE_NAME', defaultValue: '', obfuscate: true)
  static String databaseName = _EnvValues.databaseName;

  @EnviedField(varName: 'BASE_URL', defaultValue: '', obfuscate: true)
  static String baseUrl = _EnvValues.baseUrl;
}
