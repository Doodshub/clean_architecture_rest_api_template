import 'package:clean_architecture_template/clean_architecture_template.dart';
import 'package:flutter/cupertino.dart';

/// Configuration class for bulk route registration
///
/// Simplifies registering multiple routes across different routers.
///
/// Example:
/// ```dart
/// final config = RouteConfiguration(
///   authenticatedRoutes: {
///     'home': (context) => HomeScreen(),
///     'profile': (context) => ProfileScreen(),
///     'settings': (context) => SettingsScreen(),
///   },
///   unauthenticatedRoutes: {
///     'login': (context) => LoginScreen(),
///     'register': (context) => RegisterScreen(),
///   },
///   rootRoutes: {
///     'error': (context) => ErrorScreen(),
///   },
/// );
///
/// config.registerAllRoutes(
///   mainRouter: sl<MainRouter>(),
///   onboardingRouter: sl<OnboardingRouter>(),
///   rootRouter: sl<RootRouter>(),
/// );
/// ```
class RouteConfiguration {
  final Map<String, Widget Function(BuildContext)> authenticatedRoutes;
  final Map<String, Widget Function(BuildContext)> unauthenticatedRoutes;
  final Map<String, Widget Function(BuildContext)> rootRoutes;
  final bool useFullScreenDialog;

  const RouteConfiguration({
    this.authenticatedRoutes = const {},
    this.unauthenticatedRoutes = const {},
    this.rootRoutes = const {},
    this.useFullScreenDialog = false,
  });

  /// Register all configured routes to their respective routers
  void registerAllRoutes({
    required MainRouter mainRouter,
    required OnboardingRouter onboardingRouter,
    required RootRouter rootRouter,
  }) {
    // Register authenticated routes
    authenticatedRoutes.forEach((name, builder) {
      mainRouter.addRoute(
        name,
        ({settings}) => _buildRoute(builder, settings: settings),
      );
    });

    // Register unauthenticated routes
    unauthenticatedRoutes.forEach((name, builder) {
      onboardingRouter.addRoute(
        name,
        ({settings}) => _buildRoute(builder, settings: settings),
      );
    });

    // Register root routes
    rootRoutes.forEach((name, builder) {
      rootRouter.addRoute(
        name,
        ({settings}) => _buildRoute(builder, settings: settings),
      );
    });
  }

  Route<T> _buildRoute<T>(
    Widget Function(BuildContext) builder, {
    required RouteSettings? settings,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      fullscreenDialog: useFullScreenDialog,
      builder: builder,
    );
  }
}

/// Helper extension for adding individual routes more conveniently
extension RouterExtensions on AppRouter {
  /// Add a simple widget route without dealing with RouteBuilder
  ///
  /// Example:
  /// ```dart
  /// mainRouter.addWidgetRoute('home', (context) => HomeScreen());
  /// ```
  void addWidgetRoute(
    String name,
    Widget Function(BuildContext) builder, {
    bool fullScreenDialog = false,
  }) {
    addRoute(name, ({settings}) {
      return CupertinoPageRoute(
        settings: settings,
        fullscreenDialog: fullScreenDialog,
        builder: builder,
      );
    });
  }
}
