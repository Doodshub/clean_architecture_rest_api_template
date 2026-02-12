import 'package:clean_architecture_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_template/common/services/modal_service.dart';
import 'package:clean_architecture_template/common/services/user_service.dart';
import 'package:clean_architecture_template/common/utils/app_logger.dart';
import 'package:clean_architecture_template/data/database/database_service.dart';
import 'package:clean_architecture_template/models/app_environment.dart';
import 'package:clean_architecture_template/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Service Locator
// ═══════════════════════════════════════════════════════════════════════════

/// Global dependency locator used across the codebase.
///
/// Usage: `sl<MyService>()` or `sl.get<MyService>()`
final GetIt sl = GetIt.I;

extension GetItExtension on GetIt {
  Future<void> ensureReady<T extends Object>() async {
    try {
      await isReady<T>();
    } on Exception catch (e) {
      debugPrint('ensureReady caught exception: $e');
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Dependency Manager
// ═══════════════════════════════════════════════════════════════════════════

/// Central dependency manager for the application.
///
/// Manages all dependency injection using GetIt. Consuming apps should create
/// an instance, configure it, and call [init()] before use.
///
/// ## Registration Order (in constructor)
/// 1. **Core** — Logger, ModalService
/// 2. **Environment** — AppEnvironment (env, flavor, appName, databaseName)
/// 3. **Blocs** — AppBloc
/// 4. **Storage** — SharedPreferences, FlutterSecureStorage, TokenService
/// 5. **Database** — DatabaseService, UserService (via [provideLocalDatabase])
///
/// ## Consuming App Responsibilities
/// - Create [DependencyManager] with config (databaseName, env, etc.)
/// - Call [provideLocalDatabase] before repositories that need it
/// - Provide Dio (consuming apps register their own HTTP client)
/// - Register app-specific repositories, services, blocs
/// - Call [init] to await async dependencies
///
/// ## Example
/// ```dart
/// final dm = DependencyManager(
///   databaseName: 'my_app.db',
///   databaseVersion: 1,
///   env: 'dev',
///   flavor: 'dev',
///   appName: 'My App',
/// );
/// await dm.provideLocalDatabase();
/// // Register Dio, repositories, etc.
/// await dm.init();
/// ```
class DependencyManager {
  bool initialized = false;

  // ─── Configuration ─────────────────────────────────────────────────────

  /// Database file name (e.g., `my_app.db`).
  final String? databaseName;

  /// Database schema version for migrations.
  final int databaseVersion;

  /// Environment identifier (e.g., `dev`, `staging`, `prod`).
  final String? env;

  /// Build flavor (e.g., `free`, `paid`).
  final String? flavor;

  /// Application display name.
  final String? appName;

  // ─── Constructor ──────────────────────────────────────────────────────

  DependencyManager({
    this.databaseName,
    this.databaseVersion = 1,
    this.env,
    this.flavor,
    this.appName,
  }) {
    _provideCore();
    _provideEnvironment();
    _provideBlocs();
    _provideStorage();
    _provideDatabaseServices();

    sl<Logger>().i({'DependencyManager': 'Core dependencies registered'});
  }

  // ─── Lifecycle ─────────────────────────────────────────────────────────

  /// Waits for all async dependencies to be ready. Call after registering
  /// all dependencies and before using the app.
  Future<void> init() async {
    await sl.allReady();
    initialized = true;
  }

  /// Resets all registered dependencies. Use for testing or cleanup.
  Future<void> dispose() async {
    await sl.reset();
  }

  // ─── Custom Registration API ──────────────────────────────────────────

  /// Registers a repository as a lazy singleton.
  void registerRepository<T extends Object>(T Function() factory) =>
      sl.registerLazySingleton<T>(factory);

  /// Registers a service as a lazy singleton.
  void registerService<T extends Object>(T Function() factory) =>
      sl.registerLazySingleton<T>(factory);

  /// Registers a bloc as a lazy singleton.
  void registerBloc<T extends Object>(T Function() factory) =>
      sl.registerLazySingleton<T>(factory);

  /// Registers an existing instance as a singleton.
  void registerSingleton<T extends Object>(T instance) =>
      sl.registerSingleton<T>(instance);

  /// Registers a factory as a lazy singleton.
  void registerLazySingleton<T extends Object>(T Function() factory) =>
      sl.registerLazySingleton<T>(factory);

  // ─── Database (async, must be called explicitly) ────────────────────────

  /// Registers the local database. Must be called before [init] and before
  /// any code that depends on [DatabaseService] or [UserService].
  Future<void> provideLocalDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);

    final dbName = databaseName ?? sl<AppEnvironment>().databaseName;
    sl<Logger>().i({'Database': 'Creating $dbName (v$databaseVersion)'});

    final databasePath = p.join(appDir.path, dbName);
    final database = await databaseFactoryIo.openDatabase(
      databasePath,
      version: databaseVersion,
    );

    sl.registerSingleton<Database>(database);
  }

  // ─── Internal Providers ────────────────────────────────────────────────

  void _provideCore() {
    sl.registerLazySingleton<Logger>(() => Logger(printer: AppLogger()));
    sl.registerLazySingleton<ModalService>(ModalService.new);
  }

  void _provideEnvironment() {
    sl.registerLazySingleton<AppEnvironment>(() => AppEnvironment(
          env: env ?? '',
          flavor: flavor ?? '',
          appName: appName ?? '',
          databaseName: databaseName ?? '',
        ));
  }

  void _provideBlocs() {
    sl.registerLazySingleton<AppBloc>(() => AppBloc());
  }

  void _provideStorage() {
    sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );
    sl.registerLazySingleton<TokenService>(
      () => TokenService(sl<FlutterSecureStorage>()),
    );
    sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );
  }

  void _provideDatabaseServices() {
    sl.registerLazySingleton(
      () => DatabaseService(db: sl.get<Database>(), logger: sl.get<Logger>()),
    );
    sl.registerLazySingleton(() => UserService(sl.get<DatabaseService>()));
  }
}
