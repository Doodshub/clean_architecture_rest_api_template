import 'package:equatable/equatable.dart';

class AppEnvironment extends Equatable {
  const AppEnvironment({
    required this.env,
    required this.flavor,
    required this.appName,
    required this.databaseName,
    this.isTestEnvironment,
  });

  final String env;
  final String flavor;
  final String appName;
  final String databaseName;
  final bool? isTestEnvironment;

  @override
  List<Object> get props => [
    env,
    appName,
    flavor,
    databaseName,
    isTestEnvironment ?? false,
  ];
}
