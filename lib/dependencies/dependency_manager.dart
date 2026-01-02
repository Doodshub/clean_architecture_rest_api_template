import 'package:clean_architecture_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_template/common/routes/main_router.dart';
import 'package:clean_architecture_template/common/routes/onboarding_router.dart';
import 'package:clean_architecture_template/common/routes/root_router.dart';
import 'package:clean_architecture_template/common/routes/route_helper.dart';
import 'package:clean_architecture_template/common/services/modal_service.dart';
import 'package:clean_architecture_template/common/services/user_service.dart';
import 'package:clean_architecture_template/common/utils/app_logger.dart';
import 'package:clean_architecture_template/data/database/database_service.dart';
import 'package:clean_architecture_template/data/repositories/authentication_repository.dart';
import 'package:clean_architecture_template/dependencies/auth_interceptor.dart';
import 'package:clean_architecture_template/env/env.dart';
import 'package:clean_architecture_template/models/app_environment.dart';
import 'package:clean_architecture_template/services/token_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global dependency locator used across the codebase
GetIt sl = GetIt.I;

extension GetItExtension on GetIt {
  Future<void> ensureReady<T extends Object>() async {
    try {
      await isReady<T>();
    } on Exception catch (e) {
      debugPrint("ensureReady caught exception $e");
    }
  }
}

/// Central dependency manager for the application.
///
/// This class manages all dependency injection using GetIt.
/// Consuming apps can extend this to register additional dependencies.
///
/// Example:
/// ```dart
/// final dependencyManager = DependencyManager();
///
/// // Register custom repositories
/// dependencyManager.registerRepository<ProductRepository>(
///   () => ProductRepository(dio: sl<Dio>()),
/// );
///
/// // Register custom services
/// dependencyManager.registerService<NotificationService>(
///   () => NotificationService(),
/// );
///
/// // Register custom blocs
/// dependencyManager.registerBloc<ProductBloc>(
///   () => ProductBloc(),
/// );
///
/// await dependencyManager.init();
/// ```
class DependencyManager {
  bool initialized = false;

  DependencyManager() {
    // Helpers
    provideLogger();
    provideRouteHelper();
    provideDIO();
    provideModalService();

    // App Environment
    provideEnvironment();

    /// Global Blocs
    provideGlobalAppBloc();

    // Routes
    provideMainRouter();
    provideRootRouter();
    provideOnboardingRouter();

    // Repositories
    provideRepositories();

    // Databases
    provideSharedPreferences();
    // provideLocalDatabase();
    provideDatabaseService();
    provideUserService();
    provideFlutterSecureStorage();

    sl<Logger>().i({"Initialized"});
  }

  /// Register a custom repository.
  /// Call this before calling init().
  ///
  /// Example:
  /// ```dart
  /// dependencyManager.registerRepository<ProductRepository>(
  ///   () => ProductRepository(dio: sl<Dio>()),
  /// );
  /// ```
  void registerRepository<T extends Object>(T Function() factoryFunc) {
    sl.registerLazySingleton<T>(factoryFunc);
  }

  /// Register a custom service.
  /// Call this before calling init().
  ///
  /// Example:
  /// ```dart
  /// dependencyManager.registerService<NotificationService>(
  ///   () => NotificationService(database: sl<DatabaseService>()),
  /// );
  /// ```
  void registerService<T extends Object>(T Function() factoryFunc) {
    sl.registerLazySingleton<T>(factoryFunc);
  }

  /// Register a custom bloc.
  /// Call this before calling init().
  ///
  /// Example:
  /// ```dart
  /// dependencyManager.registerBloc<ProductBloc>(
  ///   () => ProductBloc(repository: sl<ProductRepository>()),
  /// );
  /// ```
  void registerBloc<T extends Object>(T Function() factoryFunc) {
    sl.registerLazySingleton<T>(factoryFunc);
  }

  /// Register any custom singleton dependency.
  /// Call this before calling init().
  void registerSingleton<T extends Object>(T instance) {
    sl.registerSingleton<T>(instance);
  }

  /// Register any custom lazy singleton dependency.
  /// Call this before calling init().
  void registerLazySingleton<T extends Object>(T Function() factoryFunc) {
    sl.registerLazySingleton<T>(factoryFunc);
  }

  void provideDIO() {
    // Register DIO
    sl.registerLazySingleton<Dio>(() {
      var dio = Dio();

      String? baseUrl = EnvValues.baseUrl;

      sl<Logger>().i({"URL: $baseUrl"});

      bool willLog = false;

      return dio
        ..options = BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: const Duration(seconds: 60),
          connectTimeout: const Duration(seconds: 60),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: willLog,
            requestBody: willLog,
            responseBody: willLog,
            responseHeader: willLog,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        )
        ..interceptors.add(AuthInterceptor(dio));
    });
  }

  Future<void> init() async {
    await sl.allReady();

    initialized = true;
  }

  Future<void> dispose() async {
    await sl.reset();
  }

  void provideEnvironment() {
    sl<Logger>().i({"Creating ${EnvValues.env} database"});
    sl.registerLazySingleton<AppEnvironment>(() {
      return AppEnvironment(
        env: EnvValues.env,
        flavor: EnvValues.flavor,
        appName: EnvValues.appName,
        databaseName: EnvValues.databaseName,
      );
    });
  }

  void provideFlutterSecureStorage() async {
    sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

    // Register TokenHelper
    sl.registerLazySingleton<TokenService>(
      () => TokenService(sl<FlutterSecureStorage>()),
    );
  }

  Future<void> provideLocalDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    sl<Logger>().i({"Creating database"});

    /// Use the database name from the environment
    // final databasePath = p.join(appDir.path, sl<AppEnvironment>().databaseName ?? "");
    final databasePath = p.join(appDir.path, "templateapp");
    final database = await databaseFactoryIo.openDatabase(
      databasePath,
      version: 1,
    );

    sl.registerSingleton<Database>(database);
  }

  void provideDatabaseService() {
    sl.registerLazySingleton(
      () => DatabaseService(db: sl.get<Database>(), logger: sl.get<Logger>()),
    );
  }

  void provideUserService() {
    sl.registerLazySingleton(() => UserService(sl.get<DatabaseService>()));
  }

  void provideRouteHelper() {
    sl.registerSingleton<RouteHelper>(RouteHelper());
  }

  void provideSharedPreferences() {
    sl.registerSingletonAsync<SharedPreferences>(() async {
      final sharedPreferences = await SharedPreferences.getInstance();

      return sharedPreferences;
    });
  }

  void provideMainRouter() {
    sl.registerSingleton<MainRouter>(MainRouter());
  }

  void provideRootRouter() {
    sl.registerSingleton<RootRouter>(RootRouter());
  }

  void provideLogger() {
    sl.registerLazySingleton<Logger>(() => Logger(printer: AppLogger()));
  }

  void provideRepositories() {
    /// AuthenticationRepository
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(dio: sl<Dio>()),
    );
  }

  void provideModalService() {
    sl.registerLazySingleton<ModalService>(ModalService.new);
  }

  void provideOnboardingRouter() {
    sl.registerSingleton<OnboardingRouter>(OnboardingRouter());
  }

  void provideGlobalAppBloc() {
    sl.registerLazySingleton<AppBloc>(() => AppBloc());
  }
}
